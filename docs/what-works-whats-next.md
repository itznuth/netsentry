# What Works / What's Next

## What Works
- Docker environment builds and starts.
- Mock web service runs on port 8080.
- Suricata configuration loads successfully.
- Local rules load successfully.
- Replay/demo script validates input and runs end-to-end.
- Evaluation script exports JSON metrics.
- Benign demo traffic produces 0 alerts.
- Malicious demo traffic produces alerts.
- Logs and metrics are stored under `results/` and `artifacts/release/`.

## What's Next
- Expand the dataset beyond the initial demo PCAPs.
- Add stronger automated tests.
- Add CI with visible coverage summary.
- Improve evaluation with additional charts and tables.
- Compare baseline and tuned rules more systematically.