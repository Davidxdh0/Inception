all: up

build:

up: 
	mkdir -p ~/home/dyeboa/data/mariadb
	mkdir -p ~/home/dyeboa/data/wordpress
# docker network create app-wordpress
	docker compose -f ./srcs/docker-compose.yml up -d

clean: 
	docker compose -f ./srcs/docker-compose.yml down 