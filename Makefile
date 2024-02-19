postgres:
	docker run --name postgres12 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d -p 5432:5432 postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root TheBestBank

dropdb:
	docker exec -it postgres12 dropdb TheBestBank

migrateup:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/TheBestBank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/TheBestBank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown
