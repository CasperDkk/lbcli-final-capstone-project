# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

TXID="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

#Extract txn data
TX_DATA=$(bitcoin-cli -signet getrawtransaction "$TXID" true)

#Get inputs and VOUT
INPUT_VALUES=$(echo "$TX_DATA" | jq -r '.vin[] | .txid + " " + (.vout|tostring)' | while read -r txid vout; do
  bitcoin-cli -signet getrawtransaction "$txid" true | jq -r ".vout[$vout].value"
done | jq -s .)

# Calculate fee (Total inputs -  Total outputs)
FEE_JSON=$(echo "$TX_DATA" | jq -r --argjson input_values "$INPUT_VALUES" '
  def fee: ($input_values | add) - ([.vout[].value] | add);
  def satoshis: (fee * 100000000 | floor);
  {"fee_satoshis": satoshis }
')

# Extract fee value
FEE_SATOSHIS=$(echo "$FEE_JSON" | jq -r '.fee_satoshis')

echo "$FEE_SATOSHIS"