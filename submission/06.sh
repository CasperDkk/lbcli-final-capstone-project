# Only one tx in block 243,821 signals opt-in RBF. What is its txid?

BLOCKHASH=$(bitcoin-cli -signet getblockhash 243821)

TXID=$(bitcoin-cli -signet getblock $BLOCKHASH 2 | jq -r '.tx[] | select(first(.vin[] | .sequence < 4294967294)) | .txid')
echo $TXID