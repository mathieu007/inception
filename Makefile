DATA_DIR =  /home/${USER}/data
WORDPRESS_DIR =  $(DATA_DIR)/wordpress/
MARIADB_DIR   =  $(DATA_DIR)/mariadb/

all: build up

build:
	@if [ ! -d $(DATA_DIR) ]; then \
        sudo mkdir -p $(DATA_DIR); \
        echo "Directory $(DATA_DIR) created."; \
    fi
	@if [ ! -d $(WORDPRESS_DIR) ]; then \
        sudo mkdir -p $(WORDPRESS_DIR); \
        echo "Directory $(WORDPRESS_DIR) created."; \
    fi
	@if [ ! -d $(MARIADB_DIR) ]; then \
        sudo mkdir -p $(MARIADB_DIR); \
        echo "Directory $(MARIADB_DIR) created."; \
    fi
	docker compose -f ./srcs/docker-compose.yml build

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

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
	sudo rm -rf $(WORDPRESS_DIR)
	sudo rm -rf $(MARIADB_DIR)
	docker-compose -f ./srcs/docker-compose.yml down --remove-orphans --volumes
	docker image prune -a -f
	docker system prune -f

rmi:
	docker rmi srcs_wordpress srcs_mariadb srcs_nginx

fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v && docker-compose -f ./srcs/docker-compose.yml down && docker-compose -f ./srcs/docker-compose.yml build --no-cache
clean:
	docker-compose -f ./srcs/docker-compose.yml down -v && docker-compose -f ./srcs/docker-compose.yml down && docker-compose -f ./srcs/docker-compose.yml build

re: prune all

.PHONY: all build up down start stop logs status prune   re