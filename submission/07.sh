# what is the coinbase tx in this block 243,834


COINBASE_BLOCK=243834

# Get the block hash for the coinbase block
COINBASE_BLOCK_HASH=$(bitcoin-cli -signet getblockhash "$COINBASE_BLOCK")

# Get the txid of the coinbase transaction
COINBASE_TX=$(bitcoin-cli -signet getblock "$COINBASE_BLOCK_HASH" | jq -r '.tx[0]')

echo $COINBASE_TX