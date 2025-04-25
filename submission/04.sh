# Which public key signed input 0 in this tx: d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7

TXID="d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7"

#Get and decode raw transaction
RAW_TX=$(bitcoin-cli -signet getrawtransaction $TXID)

DECODED_TX=$(bitcoin-cli -signet decoderawtransaction $RAW_TX)

#Get witness data for the first input
PUBLIC_KEY=$(echo "$DECODED_TX" | jq -r '.vin[0].txinwitness | .[-1]')

echo "$PUBLIC_KEY"

