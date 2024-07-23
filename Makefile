.PHONY: install
	poetry install


.PHONY: runserver
runserver:
	poetry run python -m swiftbank.manage runserver


.PHONY: precommit
precommit:
	poetry run pre-commit run --all-files

.PHONY: pre-commit-reinstall
pre-commit-reinstall:
	poetry run pre-commit uninstall; poetry run pre-commit install

.PHONY: docker-build
docker-build:
	docker build -t swiftbank-backend .

.PHONY: docker-run
docker-run:
	docker run -p 8000:8000 swiftbank-backend

