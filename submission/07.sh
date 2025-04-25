# what is the coinbase tx in this block 243,834

COINBASE_BLOCK=243834

COINBASE_TX=bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash "$COINBASE_BLOCK") | jq -r '.tx[0]'

echo $COINBASE_TX