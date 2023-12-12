compose-up:
	docker-compose up

compose-build:
	docker-compose build

flake8:
	docker-compose run --rm app -c "flake8"

container-run:
	docker-compose run --rm app

collect-static:
	docker-compose run --rm app -c "python manage.py collectstatic"
