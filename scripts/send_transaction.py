import requests
import json
import time
import mysql.connector
import hashlib

# Flask API URLs
ADD_TRANSACTION_URL = "http://127.0.0.1:5000/add_transaction"

# Connect to MySQL (phpMyAdmin)
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="water_distribution_system"
)
cursor = db.cursor()

# Generate a blockchain hash for this transaction (optional for uniqueness)
hash_input = f"{time.time()}"
transaction_hash = hashlib.sha256(hash_input.encode()).hexdigest()

# Define transaction data
transaction_data = {
    "user_id": 1,        # User receiving water
    "sponsor_id": 1,     # Sponsor funding it
    "client_id": 1,      # Client site
    "quantity": 1,       # Number of bottles (fixed 200ml per bottle)
    "type": "water_dispensed",
    "details": "200ml of water given"
}


# Send transaction request to Flask API
headers = {"Content-Type": "application/json"}
response = requests.post(ADD_TRANSACTION_URL, json=transaction_data, headers=headers)

if response.status_code == 201:
    print(f"✅ Transaction added successfully:", response.json())
    print(f"⏳ Waiting for mining...")
else:
    print("❌ Error adding transaction:", response.text)

cursor.close()
db.close()
