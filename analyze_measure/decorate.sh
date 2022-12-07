UUID=$1

curl -o asn.txt https://ftp.ripe.net/ripe/asnames/asn.txt
echo "asn,asname" > asn.csv
sed -e 's/,//g' asn.txt | awk '{print $1",\""$0"\""}' >> asn.csv
echo "CSV Join ASN to RIPE Probe list"
csvjoin -c asn_v4,asn ../create_measure/$UUID/ripe_probes$UUID.csv asn.csv > ripe_probes_asname$UUID.csv
echo "CSV Join Probe&ASN info to UUID measurement"
csvjoin -c probe_id,id ./${UUID}_a/$UUID.csv ripe_probes_asname$UUID.csv > $UUID.decorated.csv

# Cleanup
mv *$UUID.* ${UUID}_a/.
