DB_URL=mysql://root:root@tcp(localhost:3306)/orders

MIGRATIONS_PATH=internal/infra/database/migrations

createmigration:
	migrate create -ext=sql -dir="$(MIGRATIONS_PATH)" -seq init

migrate:
	migrate -path="$(MIGRATIONS_PATH)" -database "$(DB_URL)" -verbose up

migratedown:
	migrate -path="$(MIGRATIONS_PATH)" -database "$(DB_URL)" -verbose down

.PHONY: createmigration migrate migratedown