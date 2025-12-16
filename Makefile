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

.PHONY: migrate-up
migrate-up:
	@ chmod +x $(PWD)/playgrounds/api/scripts/migrate-db.sh
	@ $(PWD)/playgrounds/api/scripts/migrate-db.sh

.PHONY: make-migration
make-migration:
	@ test -n "$(NAME)" || { echo "❌ NAME is required, e.g. NAME=add_users_table"; exit 1; }
	@ chmod +x $(PWD)/playgrounds/api/scripts/create-migration.sh
	@ $(PWD)/playgrounds/api/scripts/create-migration.sh
