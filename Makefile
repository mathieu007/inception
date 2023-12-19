all : up
clean:
	@docker-compose -f ./srcs/docker-compose.yml down -v && docker-compose -f ./srcs/docker-compose.yml down && docker-compose -f ./srcs/docker-compose.yml build --no-cache
up:
	@docker-compose -f ./srcs/docker-compose.yml up -d
re_maria:
	@cd ./srcs/requirements/mariadb && docker-compose down -v && docker-compose up -d
down:
	@docker-compose -f ./srcs/docker-compose.yml down
down_volume:
	@docker-compose -f ./srcs/docker-compose.yml down -v
stop:
	@docker-compose -f ./srcs/docker-compose.yml stop
start:
	@docker-compose -f ./srcs/docker-compose.yml start
status:
	@docker ps