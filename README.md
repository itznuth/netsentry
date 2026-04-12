# NetSentry

NetSentry is a reproducible containerized intrusion detection project for CECS 478.

## Project Goal
This project uses Suricata, Docker, and PCAP replay to detect common network attacks and compare baseline rules against tuned rules.

## Features
- PCAP replay for benign and malicious traffic
- Suricata IDS container
- baseline vs tuned rule evaluation
- CSV/chart-based result summaries
- reproducible Docker workflow

## Repository Structure
- `config/` - Suricata configuration
- `rules/` - local and tuned IDS rules
- `pcaps/` - benign and malicious packet captures
- `scripts/` - setup, replay, and evaluation scripts
- `services/` - mock monitored service
- `results/` - output logs and summaries
- `docs/` - proposal and project documents

## Quick Start
```bash
make bootstrap
make up
make demo
make evaluate
