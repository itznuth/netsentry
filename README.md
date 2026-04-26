# NetSentry

NetSentry is a reproducible containerized intrusion detection project for CECS 478.

## Project Goal

This project uses Suricata, Docker, and PCAP replay to detect common network attacks and compare baseline behavior using reproducible offline traffic analysis.

## Vertical Slice

The end-to-end pipeline for this integrated release is:

PCAP replay -> detection -> logging -> summary export

The demo workflow processes replayed traffic, generates logs, and exports JSON summary metrics for evaluation.

## Features

* PCAP replay for benign and malicious traffic
* Suricata IDS container
* mock monitored web service
* JSON summary export for evaluation
* input validation in replay pipeline
* reproducible Docker workflow
* tests plus CI pipeline

## Repository Structure

* `config/` - Suricata configuration
* `rules/` - local IDS rules
* `pcaps/` - benign and malicious packet captures
* `scripts/` - bootstrap, replay, and evaluation scripts
* `services/` - mock monitored service
* `results/` - generated outputs
* `artifacts/release/` - release evidence including logs, metrics, and notes
* `docs/` - project documentation

## Quick Start

```bash
make bootstrap
make up
make demo
```

## Clean Up

```bash
make clean
```

## Outputs

After the demo run, key outputs can be found in:

* `results/eve.json`
* `artifacts/release/logs/eve.json`
* `artifacts/release/metrics/summary.json`
* `artifacts/release/metrics/summary_benign.json`
* `artifacts/release/metrics/summary_malicious.json`

## Security Invariants

* All traffic replay is performed only inside the Docker/offline PCAP workflow.
* Only approved local PCAP files under `pcaps/benign/` and `pcaps/malicious/` are accepted by the replay script.
* Input validation rejects missing files and non-`.pcap` inputs.
* Suricata logs are generated for every successful demo run.
* Summary outputs are derived only from offline replay data.

## Evaluation Progress

Initial evaluation shows that the benign demo PCAP produces 0 alerts, while the malicious demo PCAP produces multiple alerts. This demonstrates that the current NetSentry release can distinguish between the two demo traffic classes at a basic level.

## Demo Video

NetSentry integrated release demo: [Watch the demo](https://youtu.be/kXIKkWeUxec)

## Team

* Anthony Nuth
* Kenneth Vuong
