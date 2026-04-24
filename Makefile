bootstrap:
	chmod +x scripts/bootstrap.sh scripts/replay_pcap.sh
	./scripts/bootstrap.sh

up:
	docker compose up --build -d

down:
	docker compose down

logs:
	docker compose logs --no-color

demo:
	./scripts/replay_pcap.sh pcaps/malicious/demo_attack.pcap

evaluate:
	python3 scripts/evaluate.py

clean:
	docker compose down -v
	rm -rf results/*
