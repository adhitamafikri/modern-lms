.PHONY: up
up: 
	docker compose up -d --build

.PHONY: down
down: 
	docker compose down

.PHONY: clean
clean: 
	docker compose down -v

.PHONY: redis-cli
redis-cli: 
	docker compose exec -it redis redis-cli
