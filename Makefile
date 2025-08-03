.PHONY: build up down pull-models clean

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

pull-models:
	./scripts/pull_models.sh

clean:
	docker-compose down --volumes --remove-orphans
	docker system prune -f
