all: up

<<<<<<< HEAD
build:

up: 
	docker compose -f ./srcs/docker-compose.yml up -d
	
=======
up: 
	docker compose -f ./srcs/docker-compose.yml up -d

>>>>>>> refs/remotes/origin/master
clean: docker-compose down 