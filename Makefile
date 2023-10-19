all: up

up: 
	docker compose -f ./srcs/docker-compose.yml up -d

clean: docker-compose down 