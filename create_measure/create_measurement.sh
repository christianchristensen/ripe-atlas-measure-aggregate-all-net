# Args:
# 1: comma separated list of probes
# 2: count of probes requested
# 3: target hostname
# 4: descriptive name (e.g. an id to tie numerous tests together)

# Fill in RIPE Atlas email and API key:
BILL_TO=email@example.com
KEY=key-here-dead-beef

curl -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{
 "definitions": [
  {
   "target": "'$3'",
   "af": 4,
   "response_timeout": 4000,
   "description": "Traceroute to '$3' - '$4'",
   "protocol": "ICMP",
   "resolve_on_probe": true,
   "packets": 3,
   "size": 48,
   "first_hop": 1,
   "max_hops": 32,
   "paris": 16,
   "destination_option_size": 0,
   "hop_by_hop_option_size": 0,
   "dont_fragment": false,
   "skip_dns_check": false,
   "type": "traceroute"
  }
 ],
 "probes": [
  {
   "value": "'$1'",
   "type": "probes",
   "requested": '$2'
  }
 ],
 "is_oneoff": true,
 "bill_to": "'$BILL_TO'"
}' https://atlas.ripe.net/api/v2/measurements//?key=$KEY
