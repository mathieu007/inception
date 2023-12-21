
all: banner build up

build:
	docker-compose -f ./srcs/docker-compose.yml build

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

logs:
	docker-compose -f ./srcs/docker-compose.yml logs
	
status:
	docker ps

prune: down
	sudo rm -rf srcs/data
	docker system prune -f

rmi:
	docker rmi srcs_wordpress srcs_mariadb srcs_nginx

fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v && docker-compose -f ./srcs/docker-compose.yml down && docker-compose -f ./srcs/docker-compose.yml build --no-cache
clean:
	docker-compose -f ./srcs/docker-compose.yml down -v && docker-compose -f ./srcs/docker-compose.yml down && docker-compose -f ./srcs/docker-compose.yml build

re: prune all

.PHONY: all build up down start stop logs status prune rmi re