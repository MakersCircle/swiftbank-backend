.PHONY: install
	poetry install


.PHONY: runserver
runserver:
	poetry run python manage.py runserver