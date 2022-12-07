UUIDFORM=$1

curl https://ftp.ripe.net/ripe/atlas/probes/archive/meta-latest | bzcat | jq .objects | jq 'map(del(.tags))' | jq -r '(map(keys) | add | unique) as $cols | map(. as $row | $cols | map($row[.])) as $rows | $cols, $rows[] | @csv' > ripe_probes$UUIDFORM.csv
awk -F, '$16==1 {print $8}' ripe_probes$UUIDFORM.csv > connected_probe_ids$UUIDFORM.txt
