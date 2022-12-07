jq -r 'to_entries[] | .value[0][8]=.key | del(.value[0][7]) | .value[0] | @csv' $1.ripe.json > $1.ripe.csv
