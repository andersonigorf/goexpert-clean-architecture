DB_URL=mysql://root:root@tcp(localhost:3306)/orders

MIGRATIONS_PATH=internal/infra/database/migrations

PROTO_PATH=internal/infra/grpc/protofiles

createmigration:
	migrate create -ext=sql -dir="$(MIGRATIONS_PATH)" -seq init

migrate:
	migrate -path="$(MIGRATIONS_PATH)" -database "$(DB_URL)" -verbose up

migratedown:
	migrate -path="$(MIGRATIONS_PATH)" -database "$(DB_URL)" -verbose down

proto:
	protoc --go_out=. --go-grpc_out=. "$(PROTO_PATH)"/*.proto

evans:
	evans --host localhost --port 50051 -r repl

gqlgen:
	go run github.com/99designs/gqlgen generate


.PHONY: createmigration migrate migratedown proto evans gqlgen