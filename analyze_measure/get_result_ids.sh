# Args 1: Search term for result ids
KEY=key-here-dead-beef
curl "https://atlas.ripe.net/api/v2/measurements/my/?id__gt=1000000&page=1&page_size=50&sort=-id&description__contains=$1&key=$KEY" | jq .results[].id
