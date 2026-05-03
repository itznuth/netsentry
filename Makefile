bootstrap:
	chmod +x scripts/bootstrap.sh scripts/replay_pcap.sh scripts/run_demo_suite.sh
	./scripts/bootstrap.sh

up:
	docker compose up --build -d

down:
	docker compose down

logs:
	docker compose logs --no-color

demo:
	./scripts/run_demo_suite.sh

evaluate:
	python3 ./scripts/evaluate.py pcaps/malicious/demo_attack.pcap

clean:
	docker compose down -v
	rm -rf results/*