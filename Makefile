NAME = v1

all: down build up

re: data clean all

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
	sudo chmod -R 777 /home/daaf/data
	docker compose -f ./srcs/docker-compose.yml build

images: docker images

up: 
	docker compose -f ./srcs/docker-compose.yml up

down: 
	docker compose -f ./srcs/docker-compose.yml down

#Error response from daemon: Conflict. The container name "/srcs-mariadb-1" is already in use by container "x". 
#You have to remove (or rename) that container to be able to reuse that name.
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
