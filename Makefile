.PHONY: up
up:
	docker compose -f infra/docker-compose.yml up -d --build
	docker compose -f infra/docker-compose.yml ps

.PHONY: down
down:
	docker compose -f infra/docker-compose.yml down

.PHONY: restart
restart:
	docker compose -f infra/docker-compose.yml down
	docker compose -f infra/docker-compose.yml up -d --build
	docker compose -f infra/docker-compose.yml ps

.PHONY: backend-logs
backend-logs:
	docker compose -f infra/docker-compose.yml logs -f backend

.PHONY: admin-logs
admin-logs:
	docker compose -f infra/docker-compose.yml logs -f admin

.PHONY: platform-logs
platform-logs:
	docker compose -f infra/docker-compose.yml logs -f platform

.PHONY: postgres-logs
postgres-logs:
	docker compose -f infra/docker-compose.yml logs -f postgres

.PHONY: redis-logs
redis-logs:
	docker compose -f infra/docker-compose.yml logs -f redis

.PHONY: redis-cli
redis-cli:
	docker compose -f infra/docker-compose.yml exec -it redis redis-cli -a fikridev
