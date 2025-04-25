# Which tx in block 216,351 spends the coinbase output of block 216,128?

COINBASE_BLOCK=216128

#Blockhash for coinbase block
COINBASE_BLOCKHASH=$(bitcoin-cli -signet getblockhash "$COINBASE_BLOCK")

#Get txid 
COINBASE_TX=$(bitcoin-cli -signet getblock "$COINBASE_BLOCKHASH" 2 | jq -r '.tx[0].txid')

#Hash of the block containing the spending transaction
INPUT_BLOCK=216351

INPUT_BLOCKHASH=$(bitcoin-cli -signet getblockhash "$INPUT_BLOCK")

#Txn that spends the coinbase txn
SPENDING_TX=$(bitcoin-cli -signet getblock "$INPUT_BLOCKHASH" 2 | jq -r '.tx[] | first(select(.vin[].txid == "'"$COINBASE_TX"'")) | .txid')

echo "$SPENDING_TX"


