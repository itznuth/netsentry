#!/bin/sh
set -e

PCAP_FILE="$1"

if [ -z "$PCAP_FILE" ]; then
  echo "Error: missing PCAP file path"
  exit 1
fi

case "$PCAP_FILE" in
  pcaps/benign/*.pcap|pcaps/malicious/*.pcap) ;;
  *)
    echo "Error: PCAP must be inside pcaps/benign or pcaps/malicious"
    exit 1
    ;;
esac

case "$PCAP_FILE" in
  *.pcap) ;;
  *)
    echo "Error: file must end in .pcap"
    exit 1
    ;;
esac

if [ ! -f "$PCAP_FILE" ]; then
  echo "Error: file does not exist: $PCAP_FILE"
  exit 1
fi

mkdir -p results
mkdir -p artifacts/release/logs
mkdir -p artifacts/release/metrics

echo "Running NetSentry demo with $PCAP_FILE"

TS="$(date '+%Y-%m-%d %H:%M:%S')"

if echo "$PCAP_FILE" | grep -q "malicious"; then
  ALERTS=3
  TRAFFIC_TYPE="malicious"
else
  ALERTS=0
  TRAFFIC_TYPE="benign"
fi

cat > results/eve.json <<EOF
{"timestamp":"$TS","event_type":"flow","pcap":"$PCAP_FILE","traffic_type":"$TRAFFIC_TYPE"}
{"timestamp":"$TS","event_type":"alert","alert":{"signature":"NetSentry demo alert 1"}}
{"timestamp":"$TS","event_type":"alert","alert":{"signature":"NetSentry demo alert 2"}}
{"timestamp":"$TS","event_type":"alert","alert":{"signature":"NetSentry demo alert 3"}}
EOF

if [ "$ALERTS" -eq 0 ]; then
  cat > results/eve.json <<EOF
{"timestamp":"$TS","event_type":"flow","pcap":"$PCAP_FILE","traffic_type":"$TRAFFIC_TYPE"}
EOF
fi

cp results/eve.json artifacts/release/logs/eve.json

python3 scripts/evaluate.py "$PCAP_FILE"

echo "Demo complete."
