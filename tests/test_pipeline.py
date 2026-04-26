from pathlib import Path
import subprocess
import json

REPO = Path(__file__).resolve().parent.parent

def run_script(path: str):
    return subprocess.run(
        ["bash", "scripts/replay_pcap.sh", path],
        cwd=REPO,
        capture_output=True,
        text=True,
    )

def test_malicious_pcap_runs():
    result = run_script("pcaps/malicious/demo_attack.pcap")
    assert result.returncode == 0
    summary = json.loads(Path(REPO / "artifacts/release/metrics/summary.json").read_text())
    assert summary["status"] == "ok"
    assert summary["alerts_detected"] >= 1

def test_missing_file_fails():
    result = run_script("pcaps/malicious/does_not_exist.pcap")
    assert result.returncode != 0

def test_wrong_extension_fails():
    bad = REPO / "pcaps/malicious/not_a_pcap.txt"
    bad.write_text("bad")
    result = run_script("pcaps/malicious/not_a_pcap.txt")
    assert result.returncode != 0
    bad.unlink()

def test_benign_pcap_has_zero_alerts():
    result = run_script("pcaps/benign/demo_normal.pcap")
    assert result.returncode == 0
    summary = json.loads(Path(REPO / "artifacts/release/metrics/summary.json").read_text())
    assert summary["alerts_detected"] == 0