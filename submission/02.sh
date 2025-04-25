# How many new outputs were created by block 243,825?

BLOCKHASH=$(bitcoin-cli -signet getblockhash 243825)

#Extract transaction data and count outputs
OUTPUTS_COUNT=$(bitcoin-cli -signet getblock $BLOCKHASH 2 | jq '[.tx[].vout[]] | length')

echo $OUTPUTS_COUNT
