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

.PHONY: db-migrate-up
db-migrate-up:
	@ chmod +x $(PWD)/playgrounds/api/scripts/migrate-db.sh
	@ $(PWD)/playgrounds/api/scripts/migrate-db.sh

.PHONY: db-create-migration
db-create-migration:
	@ test -n "$(NAME)" || { echo "❌ NAME is required, e.g. NAME=add_users_table"; exit 1; }
	@ chmod +x $(PWD)/playgrounds/api/scripts/create-migration.sh
	@ $(PWD)/playgrounds/api/scripts/create-migration.sh
