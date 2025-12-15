import hashlib
import json
import time
import mysql.connector
from flask import Flask, request, jsonify, render_template_string
from datetime import datetime
import uuid
from decimal import Decimal

app = Flask(__name__)

def safe_jsonify(data):
    """Safely convert datetime/Decimal to JSON-friendly types."""
    def serialize(obj):
        if isinstance(obj, datetime):
            return obj.isoformat()   # '2025-09-10T02:14:00'
        if isinstance(obj, Decimal):
            return float(obj)        # 123.45
        return str(obj)              # fallback
    import json
    return json.loads(json.dumps(data, default=serialize))

# -----------------------------
# DB helper
# -----------------------------
def get_db(dict_cursor=False):
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="water_distribution_system"
    )
    if dict_cursor:
        return conn, conn.cursor(dictionary=True)
    return conn, conn.cursor()

# -----------------------------
# Session → current user
# -----------------------------
def resolve_current_user():
    """
    Resolve current user from PHP session id.
    Returns (user_id, role, sponsor_id or None).
    """
    sess = request.headers.get('X-Session-ID')
    if not sess:
        return None, None, None

    conn, cur = get_db()
    try:
        cur.execute(
            """
            SELECT us.UserID, u.Role
            FROM user_sessions us
            JOIN users u ON u.UserID = us.UserID
            WHERE us.SessionID = %s AND us.ExpiresAt > NOW()
            LIMIT 1
            """,
            (sess,)
        )
        row = cur.fetchone()
        if not row:
            return None, None, None

        user_id, role = row
        sponsor_id = None

        if role == "Sponsor":
            cur.execute("SELECT SponsorID FROM sponsorships WHERE UserID = %s LIMIT 1", (user_id,))
            srow = cur.fetchone()
            if srow:
                sponsor_id = srow[0]

        return user_id, role, sponsor_id
    finally:
        cur.close()
        conn.close()

# -----------------------------
# Blockchain core
# -----------------------------
class Blockchain:
    def __init__(self):
        self.chain = self.load_chain_from_db()
        self.pending_transactions = []

        if len(self.chain) == 0:
            # Genesis block (not persisted; actual persistence happens on mine)
            self.create_block(proof=1, previous_hash="0")

    def get_last_block(self):
        return self.chain[-1]

    def hash_block(self, block):
        """
        Deterministic hash: ensure only JSON-serializable fields included
        and sort keys. Transactions list must be serializable dictionaries.
        """
        material = {
            "index": block["index"],
            "timestamp": block["timestamp"],
            "transactions": block["transactions"],
            "proof": block["proof"],
            "previous_hash": block["previous_hash"],
        }
        return hashlib.sha256(json.dumps(material, sort_keys=True).encode()).hexdigest()

    def create_block(self, proof, previous_hash):
        block = {
            'index': len(self.chain) + 1,
            'timestamp': time.time(),
            'transactions': self.pending_transactions,
            'proof': proof,
            'previous_hash': previous_hash
        }
        block['hash'] = self.hash_block(block)  # attach hash
        self.chain.append(block)
        self.pending_transactions = []
        return block

    def add_transaction(self, user_id, transaction_type, quantity, details="", sponsor_id=None, client_id=None):
        """
        1) Insert a dispense in water_dispenses
        2) Stage a blockchain transaction for mining
        """
        # 1) Persist water dispense first
        conn, cur = get_db()
        try:
            cur.execute(
                """
                INSERT INTO water_dispenses (UserID, SponsorID, ClientID, Quantity, DispenseDate)
                VALUES (%s, %s, %s, %s, NOW())
                """,
                (user_id, sponsor_id, client_id, quantity)
            )
            dispense_id = cur.lastrowid
            conn.commit()
        finally:
            cur.close()
            conn.close()

        # 2) Stage a pending blockchain transaction
        timestamp_ns = time.time_ns()
        nonce = uuid.uuid4().hex
        tx_material = f"{nonce}{user_id}{transaction_type}{quantity}{details}{timestamp_ns}{dispense_id}"
        tx_hash = hashlib.sha256(tx_material.encode()).hexdigest()

        self.pending_transactions.append({
            'dispense_id': dispense_id,
            'user_id': user_id,
            'sponsor_id': sponsor_id,
            'client_id': client_id,
            'type': transaction_type,
            'quantity': quantity,
            'details': details,
            'timestamp': timestamp_ns,  # int (JSON-safe)
            'hash': tx_hash
        })

        return {"message": "Transaction added successfully", "hash": tx_hash}, 201

    def proof_of_work(self, previous_proof, previous_hash):
        new_proof = 1
        while True:
            guess = f"{new_proof}{previous_proof}{previous_hash}".encode()
            if hashlib.sha256(guess).hexdigest()[:4] == "0000":
                return new_proof
            new_proof += 1

    def load_chain_from_db(self):
        """
        Reconstruct a simple chain shell from DB blocks.
        Note: We don't load transactions into self.chain (kept lightweight).
        """
        conn, cur = get_db()
        try:
            cur.execute("SELECT BlockID, BlockIndex, Timestamp, Hash, PreviousHash, Proof FROM blocks ORDER BY BlockID")
            chain = []
            for row in cur.fetchall():
                block_id, block_index, ts, h, prev_h, proof = row
                # store timestamp as unix float for consistent hashing logic (we do not rehash DB blocks)
                if isinstance(ts, datetime):
                    ts_val = ts.timestamp()
                else:
                    ts_val = float(time.time())  # fallback
                chain.append({
                    'block_id': block_id,
                    'index': block_index,
                    'timestamp': ts_val,
                    'hash': h,
                    'previous_hash': prev_h,
                    'proof': proof,
                    'transactions': []
                })
            return chain
        finally:
            cur.close()
            conn.close()

blockchain = Blockchain()

class FinancialBlockchain:
    def __init__(self):
        self.conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",  # your MySQL root password
            database="water_distribution_system"
        )
        self.conn.autocommit = True
        self.pending_transactions = []
        self.ensure_genesis_block()

    def ensure_genesis_block(self):
        cur = self.conn.cursor()
        # check if genesis block exists
        cur.execute("SELECT COUNT(*) FROM finance_blocks")
        if cur.fetchone()[0] == 0:
            genesis_hash = hashlib.sha256("genesis".encode()).hexdigest()
            cur.execute("""
                INSERT INTO finance_blocks
                (BlockIndex, BlockTimestamp, BlockHash, Timestamp, Hash, PreviousHash, Proof)
                VALUES (%s,%s,%s,%s,%s,%s,%s)
            """, (
                0,
                datetime.now(),
                genesis_hash,      # BlockHash
                datetime.now(),
                genesis_hash,      # Hash
                "0",
                0
            ))
        cur.close()

    def add_transaction(self, sponsor_id, client_id, amount, party, tx_type, details=""):
        cur = self.conn.cursor()
        timestamp = datetime.now()
        tx_data = f"{sponsor_id}{client_id}{amount}{party}{tx_type}{timestamp}{details}"
        tx_hash = hashlib.sha256(tx_data.encode()).hexdigest()

        cur.execute("""
            INSERT INTO financial_transactions
            (SponsorID, ClientID, Amount, Party, TxType, TxTimestamp, TxHash, Details)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
        """, (
            sponsor_id,
            client_id,
            amount,
            party,
            tx_type,
            timestamp,
            tx_hash,
            details
        ))

        tx_id = cur.lastrowid
        cur.close()
        return {"message": "Transaction added successfully", "transaction_id": tx_id, "tx_hash": tx_hash}

    def mine_block(self):
        cur = self.conn.cursor(dictionary=True)

        # get unmined transactions
        cur.execute("SELECT * FROM financial_transactions WHERE TransactionID NOT IN (SELECT TransactionID FROM finance_records)")
        txs = cur.fetchall()
        if not txs:
            return None

        # last block
        cur.execute("SELECT * FROM finance_blocks ORDER BY BlockID DESC LIMIT 1")
        last_block = cur.fetchone()
        prev_hash = last_block['Hash'] if last_block else "0"
        index = last_block['BlockIndex'] + 1 if last_block else 1

        # proof of work
        nonce = 0
        while True:
            block_data = f"{prev_hash}{txs}{nonce}{datetime.now()}"
            block_hash = hashlib.sha256(block_data.encode()).hexdigest()
            if block_hash.startswith("0000"):  # simple PoW rule
                break
            nonce += 1

        # insert new block
        cur.execute("""
            INSERT INTO finance_blocks
            (BlockIndex, BlockTimestamp, BlockHash, Timestamp, Hash, PreviousHash, Proof)
            VALUES (%s,%s,%s,%s,%s,%s,%s)
        """, (
            index,
            datetime.now(),
            block_hash,          # BlockHash
            datetime.now(),
            block_hash,          # Hash
            prev_hash,
            nonce
        ))
        block_id = cur.lastrowid

        # link transactions into finance_records
        for tx in txs:
            cur.execute("""
                INSERT INTO finance_records (BlockID, TransactionID, TxHash, Proof)
                VALUES (%s,%s,%s,%s)
            """, (
                block_id,
                tx['TransactionID'],
                tx['TxHash'],
                nonce
            ))

        cur.close()
        return {
            "block_id": block_id,
            "hash": block_hash,
            "previous_hash": prev_hash,
            "transactions": txs
        }

    def get_chain(self):
        cur = self.conn.cursor(dictionary=True)
        cur.execute("SELECT * FROM finance_blocks ORDER BY BlockIndex ASC")
        blocks = cur.fetchall()
        for b in blocks:
            cur.execute("""
                SELECT ft.* 
                FROM finance_records fr
                JOIN financial_transactions ft ON ft.TransactionID = fr.TransactionID
                WHERE fr.BlockID=%s
            """, (b['BlockID'],))
            b['transactions'] = cur.fetchall()
        cur.close()
        return blocks

finance_chain = FinancialBlockchain()

# -----------------------------
# Routes
# -----------------------------
@app.route('/add_financial', methods=['POST'])
def add_financial_route():
    data = request.get_json(silent=True) or {}
    required = ['sponsor_id', 'client_id', 'amount', 'party', 'tx_type']
    if not all(field in data and data[field] is not None for field in required):
        return jsonify({'message': 'Missing required fields'}), 400

    result = finance_chain.add_transaction(
        sponsor_id=data['sponsor_id'],
        client_id=data['client_id'],
        amount=data['amount'],
        party=data['party'],
        tx_type=data['tx_type'],
        details=data.get('details', "")
    )
    return jsonify(safe_jsonify(result)), 201


@app.route('/mine_financial', methods=['GET'])
def mine_financial():
    block = finance_chain.mine_block()
    if not block:
        return jsonify({"error": "No block mined"}), 400
    return jsonify(safe_jsonify(block)), 201


@app.route('/get_financial_chain', methods=['GET'])
def get_financial_chain_route():
    chain = finance_chain.get_chain()
    return jsonify(safe_jsonify({"chain": chain, "length": len(chain)})), 200


@app.route('/add_transaction', methods=['POST'])
def add_transaction_route():
    data = request.get_json(silent=True) or {}
    required_fields = ['user_id', 'sponsor_id', 'client_id', 'quantity']

    if not all(field in data and data[field] is not None for field in required_fields):
        return jsonify({'message': 'Missing fields'}), 400

    response, status = blockchain.add_transaction(
        data['user_id'],
        data.get('type', 'water_dispensed'),
        data['quantity'],
        data.get('details', ""),
        data['sponsor_id'],
        data['client_id']
    )
    return jsonify(response), status

@app.route('/mine', methods=['GET', 'POST'])
def mine_block():
    try:
        if len(blockchain.pending_transactions) == 0:
            return render_template_string(
                "<h1>⛏️ Nothing to mine</h1><p>No pending transactions.</p>"
            ), 200

        last_block = blockchain.get_last_block()
        # we already store last block's hash; use it directly as the linkage
        previous_hash = last_block['hash']
        proof = blockchain.proof_of_work(last_block['proof'], previous_hash)

        # create the new block in memory
        block = blockchain.create_block(proof, previous_hash)

        # persist to DB
        conn, cur = get_db()
        try:
            cur.execute(
                """
                INSERT INTO blocks (BlockIndex, Timestamp, Hash, PreviousHash, Proof)
                VALUES (%s, %s, %s, %s, %s)
                """,
                (block['index'], datetime.fromtimestamp(block['timestamp']), block['hash'], block['previous_hash'], block['proof'])
            )
            block_id = cur.lastrowid

            # write tx links
            for tx in block['transactions']:
                cur.execute(
                    """
                    INSERT INTO blockchain_records (BlockID, TransactionID, Hash, Proof)
                    VALUES (%s, %s, %s, %s)
                    """,
                    (block_id, tx['dispense_id'], tx['hash'], proof)
                )

            conn.commit()
        finally:
            cur.close()
            conn.close()

        # pretty HTML
        return render_template_string("""
            <h1>✅ Block Mined</h1>
            <p><b>Index:</b> {{block.index}}</p>
            <p><b>Hash:</b> {{block.hash}}</p>
            <p><b>Previous Hash:</b> {{block.previous_hash}}</p>
            <p><b>Proof:</b> {{block.proof}}</p>
            <h3>Transactions:</h3>
            <ul>
            {% for tx in block.transactions %}
              <li>DispenseID: {{tx.dispense_id}}, Qty: {{tx.quantity}}, Hash: {{tx.hash}}</li>
            {% endfor %}
            </ul>
        """, block=block)

    except Exception as e:
        return render_template_string("<h1>❌ Error</h1><p>{{err}}</p>", err=str(e)), 500

@app.route('/get_chain', methods=['GET'])
def get_chain():
    sess = request.headers.get('X-Session-ID') or request.args.get('sid')
    user_id, role, sponsor_id = resolve_current_user()

    conn, cur = get_db()
    try:
        # pull blocks
        cur.execute("""
            SELECT BlockID, BlockIndex, Timestamp, Hash, PreviousHash, Proof
            FROM blocks
            ORDER BY BlockID
        """)
        blocks = cur.fetchall()

        chain = []
        for (block_id, block_index, timestamp, hash_val, prev_hash, proof) in blocks:
            # fetch tx for this block
            cur.execute("""
                SELECT TransactionID, Timestamp, Hash, Proof
                FROM blockchain_records
                WHERE BlockID = %s
                ORDER BY RecordID
            """, (block_id,))
            tx_rows = cur.fetchall()

            transactions = []
            for (transaction_id, tx_time, tx_hash, tx_proof) in tx_rows:
                # masked by default
                details = "🔒 Encrypted"

                # join dispense + user to decide if we can unmask
                cur.execute("""
                    SELECT wd.DispenseID, wd.UserID, wd.SponsorID, wd.ClientID, wd.Quantity, wd.DispenseDate,
                           u.Name, u.Email
                    FROM water_dispenses wd
                    JOIN users u ON u.UserID = wd.UserID
                    WHERE wd.DispenseID = %s
                    LIMIT 1
                """, (transaction_id,))
                wd = cur.fetchone()

                if wd:
                    (dispense_id, tx_user_id, tx_sponsor_id, client_id,
                     qty, dispense_date, user_name, user_email) = wd

                    if role == "Admin":
                        details = {
                            "DispenseID": dispense_id,
                            "User": {
                                "UserID": tx_user_id,
                                "Name": user_name,
                                "Email": user_email
                            },
                            "SponsorID": tx_sponsor_id,
                            "ClientID": client_id,
                            "Quantity": qty,
                            "DispenseDate": dispense_date.strftime("%Y-%m-%d %H:%M:%S") if isinstance(dispense_date, datetime) else str(dispense_date)
                        }
                    elif role == "Sponsor" and sponsor_id == tx_sponsor_id:
                        details = {
                            "DispenseID": dispense_id,
                            "User": {
                                "UserID": tx_user_id,
                                "Name": user_name,
                                "Email": user_email
                            },
                            "ClientID": client_id,
                            "Quantity": qty,
                            "DispenseDate": dispense_date.strftime("%Y-%m-%d %H:%M:%S") if isinstance(dispense_date, datetime) else str(dispense_date)
                        }
                    # else -> keep masked

                transactions.append({
                    "transaction_id": transaction_id,
                    "timestamp": (tx_time.strftime("%Y-%m-%d %H:%M:%S") if isinstance(tx_time, datetime) else str(tx_time)),
                    "hash": tx_hash,
                    "proof": tx_proof,
                    "details": details
                })

            chain.append({
                "block_id": block_id,
                "index": block_index,
                "timestamp": (timestamp.strftime("%Y-%m-%d %H:%M:%S") if isinstance(timestamp, datetime) else str(timestamp)),
                "hash": hash_val,
                "previous_hash": prev_hash,
                "proof": proof,
                "transactions": transactions
            })

        # simple HTML explorer (masked/unmasked already applied above)
        return render_template_string("""
            <h1>📜 Blockchain</h1>
            {% for block in chain %}
              <div style="border:1px solid #ccc; padding:10px; margin:10px;">
                <h2>Block {{block.index}}</h2>
                <p><b>Hash:</b> {{block.hash}}</p>
                <p><b>Previous Hash:</b> {{block.previous_hash}}</p>
                <p><b>Proof:</b> {{block.proof}}</p>
                <h3>Transactions:</h3>
                <ul>
                  {% for tx in block.transactions %}
                    <li>
                      <div><b>TxID:</b> {{tx.transaction_id}} | <b>Hash:</b> {{tx.hash}} | <b>Time:</b> {{tx.timestamp}}</div>
                      <div><b>Details:</b>
                        {% if tx.details is string %}
                          {{ tx.details }}
                        {% else %}
                          <pre style="white-space:pre-wrap">{{ tx.details | tojson(indent=2) }}</pre>
                        {% endif %}
                      </div>
                    </li>
                  {% endfor %}
                </ul>
              </div>
            {% endfor %}
        """, chain=chain)

    finally:
        cur.close()
        conn.close()

# -----------------------------
# Run
# -----------------------------
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
