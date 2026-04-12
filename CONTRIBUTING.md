# Contributing

## Team Workflow
This project is developed by a two-person team. Both contributors are expected to coordinate changes, test work locally when possible, and document major updates clearly.

## Roles
### Anthony Nuth
- Docker setup
- Suricata integration
- monitored service setup
- replay pipeline

### Kenneth Vuong
- PCAP collection and traffic generation
- tuned/custom rule development
- evaluation scripts and result summaries
- reproducibility validation

Both contributors will help with testing, debugging, documentation, report writing, and final presentation preparation.

## Branching
Contributors should use feature branches instead of committing directly to `main`.

Example branch names:
- `feature/suricata-setup`
- `feature/pcap-replay`
- `feature/evaluation`
- `docs/proposal-update`

## Commits
Use clear commit messages that describe what changed.

Examples:
- `add docker compose stub`
- `add Suricata config placeholder`
- `add PCAP folder structure`
- `update README with quick start steps`

## Pull Requests
Before merging:
- verify the project structure still works
- update documentation if setup changed
- summarize what changed

## Testing Expectations
Before merging major changes, contributors should:
- verify setup scripts still run
- verify the Docker environment still starts
- verify scripts still produce expected placeholder output
