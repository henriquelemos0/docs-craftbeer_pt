prepare:
	docker-compose up -d
	docker exec -it docs-craftbeer sphinx-quickstart
	docker restart docs-craftbeer

run:
	docker-compose up -d
	docker exec -it docs-craftbeer make html

stop:
	docker-compose down
