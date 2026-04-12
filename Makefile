bootstrap:
	chmod +x scripts/bootstrap.sh
	./scripts/bootstrap.sh

up:
	docker compose up --build

down:
	docker compose down

demo:
	./scripts/replay_pcap.sh

evaluate:
	python3 scripts/evaluate.py
