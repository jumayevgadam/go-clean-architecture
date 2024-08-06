run: 
	go run cmd/main.go

tidy:
	go mod tidy	

migration_create:
	migrate create -ext sql -dir ./internal/schemas/ -seq files_1

migrate_up:
	migrate -path ./internal/schemas/ -database "postgresql://postgres:123456@localhost:5432/architecture?sslmode=disable" -verbose up

migrate_down:
	migrate -path ./internal/schemas/ -database "postgresql://postgres:123456@localhost:5432/architecture?sslmode=disable" -verbose down

migrate_fix_version:
	migrate -path ./internal/schemas/ -database "postgresql://postgres:123456@localhost:5432/architecture?sslmode=disable" force 1

.PHONY: run tidy migration_create migrate_up migrate_down migrate_fix_version