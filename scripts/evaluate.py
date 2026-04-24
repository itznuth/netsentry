import json
import sys
from pathlib import Path

pcap_file = sys.argv[1] if len(sys.argv) > 1 else "unknown"
eve_path = Path("results/eve.json")
out_path = Path("artifacts/release/metrics/summary.json")

alerts = 0
events = 0

if eve_path.exists():
    with eve_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            events += 1
            try:
                obj = json.loads(line)
                if obj.get("event_type") == "alert":
                    alerts += 1
            except json.JSONDecodeError:
                pass

summary = {
    "pcap": pcap_file,
    "events_processed": events,
    "alerts_detected": alerts,
    "status": "ok"
}

out_path.parent.mkdir(parents=True, exist_ok=True)
with out_path.open("w", encoding="utf-8") as f:
    json.dump(summary, f, indent=2)

print(json.dumps(summary, indent=2))
