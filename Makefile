# Make Execution Config
init:
	@buildno
	@up
	@npm-install
	@npm-dev
up:
	docker compose up -d
build:
	docker compose build
buildno:
	docker compose build --no-cache --force-rm
remake:
	@make destroy
	docker compose up -d --build
stop:
	docker compose stop
down:
	docker compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker compose down --volumes --remove-orphans
ps:
	docker compose ps
logs:
	docker compose logs
api:
	docker compose exec api bash
web:
	docker compose exec web bash
cli:
	docker compose exec client bash
db:
	docker compose exec db bash
npm-install:
	docker compose exec client npm install
npm-dev:
	docker compose exec client npm run dev