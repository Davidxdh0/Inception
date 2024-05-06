NAME = v1

all: clean build up

re: data all

wordpress:
	docker build -t "davidwp" ./srcs/requirements/wordpress
	docker run --rm -it davidwp /bin/sh

mariadb:
	docker build -t "davidmdb" ./srcs/requirements/mariadb
	docker run --rm --env-file ./srcs/.env davidmdb

build: 
	mkdir -p /home/daaf/data
	mkdir -p /home/daaf/data/wordpress
	mkdir -p /home/daaf/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up --build

images: docker images

up: 
	docker compose -f ./srcs/docker-compose.yml up

down: 
	docker compose -f ./srcs/docker-compose.yml down -v

clean: 
	docker compose -f ./srcs/docker-compose.yml down -v --rmi all --remove-orphans

data:
	sudo rm -rf /home/daaf/data
#	docker stop $(docker ps -a -q)
# 	docker rmi $(docker images -q --filter "dangling=true")

cclean:
	docker system prune -af
#docker volume rm $(docker volume ls -qf dangling=true)
ps: 
	docker ps
cls: 
	docker container ls

#tail -f /var/log/nginx/error.log