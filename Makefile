compose-up:
	docker-compose up

compose-build:
	docker-compose build

lint:
	docker-compose run --rm app flake8

test:
	docker-compose run --rm app python manage.py test

container-run:
	docker-compose run --rm app

collect-static:
	docker-compose run --rm app -c "python manage.py collectstatic"
