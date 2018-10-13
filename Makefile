prepare:
	docker-compose up -d
	docker exec -it docs-craftbeer sphinx-quickstart
	docker restart docs-craftbeer

run:
	docker-compose up -d

stop:
	docker-compose down
