run:
	docker-compose up -d
	docker exec -it docs-craftbeer make html

build:
	docker exec -it docs-craftbeer make html

stop:
	docker-compose down

init-i18n:
	docker exec -it docs-craftbeer pip install --upgrade pip
	docker exec -it docs-craftbeer pip install sphinx-intl
	docker exec -it docs-craftbeer sphinx-intl update -p _build/gettext -l pt_BR
	docker exec -it docs-craftbeer pip install transifex-client
	docker exec -it docs-craftbeer tx init --token $TOKEN --no-interactive
	docker exec -it docs-craftbeer tx config mapping-bulk --project 'Craftbeer' --file-extension '.pot' --source-file-dir 'docs/_build/gettext' --source-language 'en' --type 'PO' --expression 'locales/<lang>/LC_MESSAGES/index.po' --execute
	docker exec -it docs-craftbeer tx config mapping-bulk --project 'Craftbeer' --file-extension '.pot' --source-file-dir 'docs/_build/gettext' --source-language 'en' --type 'PO' --expression 'locales/<lang>/LC_MESSAGES/process.po' --execute