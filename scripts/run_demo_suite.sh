#!/bin/sh
set -e

mkdir -p artifacts/release/metrics
mkdir -p artifacts/release/charts

echo "Running benign demo..."
bash ./scripts/replay_pcap.sh pcaps/benign/demo_normal.pcap
cp artifacts/release/metrics/summary.json artifacts/release/metrics/summary_benign.json

echo "Running malicious demo..."
bash ./scripts/replay_pcap.sh pcaps/malicious/demo_attack.pcap
cp artifacts/release/metrics/summary.json artifacts/release/metrics/summary_malicious.json

python3 - <<'EOF'
import json
from pathlib import Path

benign_path = Path("artifacts/release/metrics/summary_benign.json")
malicious_path = Path("artifacts/release/metrics/summary_malicious.json")
csv_path = Path("artifacts/release/charts/alert_counts.csv")
md_path = Path("artifacts/release/charts/alert_counts.md")

benign = json.loads(benign_path.read_text())
malicious = json.loads(malicious_path.read_text())

csv_path.write_text(
    "traffic_type,events_processed,alerts_detected\n"
    f"benign,{benign['events_processed']},{benign['alerts_detected']}\n"
    f"malicious,{malicious['events_processed']},{malicious['alerts_detected']}\n"
)

md_path.write_text(
    "# NetSentry Demo Alert Comparison\n\n"
    "| Traffic Type | Events Processed | Alerts Detected |\n"
    "|--------------|------------------|-----------------|\n"
    f"| Benign | {benign['events_processed']} | {benign['alerts_detected']} |\n"
    f"| Malicious | {malicious['events_processed']} | {malicious['alerts_detected']} |\n"
)

print("Generated comparison artifacts:")
print(f"- {csv_path}")
print(f"- {md_path}")
EOF

echo "Demo suite complete."