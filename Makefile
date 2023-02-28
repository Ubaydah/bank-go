createdb:
	docker exec -it postgres createdb --username=root --owner=root bank

dropdb:
	docker exec -it postgres dropdb bank

migrateup:
	migrate -source 'file://db/migrations' -database 'postgresql://root:secret@127.0.0.1:5433/bank?sslmode=disable' up

migratedown:
	migrate -source 'file://db/migrations' -database 'postgresql://root:secret@127.0.0.1:5433/bank?sslmode=disable' down

.PHONY: createdb dropdb migrateup migratedown
