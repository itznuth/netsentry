# NetSentry Final Report Draft

## 1. Problem Statement
NetSentry addresses the problem of reproducible intrusion detection evaluation in a controlled Docker-based lab environment. Many IDS demonstrations show one-time results, but they are difficult to rebuild and compare across systems. This project focuses on creating a reproducible pipeline using Suricata, Docker, and controlled PCAP-driven demo inputs so that results can be regenerated and evaluated consistently.

## 2. System Design
NetSentry uses a Docker-based architecture with two main services: a mock web service and a Suricata IDS container. The mock web service provides a simple network-facing application for validation, while Suricata loads the project configuration and local rules. A replay/demo script processes selected benign or malicious PCAP inputs, generates structured log output, and passes those logs to an evaluation script that exports JSON summaries. Artifacts are saved under the release directory for reproducibility and analysis.

## 3. Threat Model
The system assumes an external attacker generating suspicious traffic toward a monitored service. Relevant traffic classes include benign requests and malicious or suspicious traffic represented by the demo PCAP inputs. The primary assets are the integrity of the logs, the correctness of the summary outputs, and the reproducibility of the detection pipeline. NetSentry is detection-focused rather than prevention-focused. It assumes a controlled Docker/offline PCAP workflow and does not claim to provide full real-time protection against arbitrary production traffic.

## 4. Methods
NetSentry was implemented using Docker Compose, a Python-based mock web service, Suricata configuration and local rules, a replay/demo script, and a Python evaluation script. The main workflow is executed through `make clean && make up && make demo`. The replay script validates allowed PCAP inputs, generates or processes the expected detection flow, writes `eve.json`-style log output, and invokes the evaluation script. The evaluation script reads the generated log and exports summary metrics as JSON. Tests were added for happy-path and negative/edge cases, and CI was configured in GitHub Actions to run the test suite with coverage output.

## 5. Results
Initial evaluation compared a benign demo PCAP and a malicious demo PCAP. The benign input produced 0 alerts, while the malicious input produced multiple alerts. These outputs were stored in `summary_benign.json` and `summary_malicious.json`, and a comparison CSV was also added under the release artifacts. The results show that the current NetSentry pipeline can distinguish between the two demo traffic classes at a basic level in a reproducible environment.

## 6. Limitations
The current release uses a controlled offline/demo pipeline rather than a full live packet replay path into a production-style IDS deployment. The attack scenarios are limited, and the project does not claim complete real-world coverage against novel, stealthy, or large-scale attacks. NetSentry is best understood as a reproducible IDS evaluation pipeline and demo harness rather than a full enterprise intrusion detection system.

## 7. Future Work
Future work includes adding more realistic live replay behavior, expanding the PCAP dataset, improving rule coverage, refining baseline versus tuned-rule comparisons, and adding richer results visualizations. Additional attack categories and more detailed performance measurements would also strengthen the system.
