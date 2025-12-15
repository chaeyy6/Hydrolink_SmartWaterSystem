import requests
import json

# Flask server endpoint for financial transactions
url = "http://127.0.0.1:5000/add_financial"

# Sample test data
payload = {
    "sponsor_id": 1,        # Example sponsor
    "client_id": 2,         # Example client
    "amount": 20.0,         # PHP amount
    "party": "Sponsor",     # Sponsor | Client | Company
    "tx_type": "Credit",    # Credit | Debit | Claim
    "details": "Test sponsorship ₱20 credit"
}

headers = {
    "Content-Type": "application/json",
    # optional: attach session if you want role-based access
    # "X-Session-ID": "abc123"
}

try:
    response = requests.post(url, json=payload)
    print("Status Code:", response.status_code)
    try:
        print("Response JSON:", response.json())
    except Exception:
        print("Raw Response:", response.text)  # fallback to raw HTML/text
except Exception as e:
    print("❌ Error sending financial transaction:", str(e))

