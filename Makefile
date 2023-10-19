all: up

build:

up: 
# docker network create app-wordpress
	docker compose -f ./srcs/docker-compose.yml up -d

clean: 
	docker compose -f ./srcs/docker-compose.yml down 