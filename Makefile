run:
	docker-compose up -d
	docker exec -it docs-craftbeer make html

build:
	docker exec -it docs-craftbeer make html

stop:
	docker-compose down