.PHONY: install
	poetry install


.PHONY: runserver
runserver:
	poetry run python -m swiftbank.manage runserver