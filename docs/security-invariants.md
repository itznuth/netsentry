# Security Invariants

- All traffic replay is performed only inside the Docker/offline PCAP workflow.
- Only approved local PCAP files under `pcaps/benign/` and `pcaps/malicious/` are accepted by the replay script.
- Input validation rejects missing files and non-`.pcap` inputs.
- Suricata logs are generated for every successful demo run.
- Summary outputs are derived only from offline replay data.