postgres:
	docker run --name postgres17.4 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:17.4-alpine3.21

createdb:
	docker exec -it postgres17.4 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres17.4 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test : 
	go clean -testcache && go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test