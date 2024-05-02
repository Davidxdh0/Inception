NAME = v1

all: clean build up

wordpress:
	docker build -t "davidwp" ./srcs/requirements/wordpress
	docker run --rm -it davidwp /bin/sh

mariadb:
	docker build -t "davidmdb" ./srcs/requirements/mariadb
	docker run --rm -it davidmdb mysql -u username -p

build: 
	mkdir -p /home/daaf/data
	mkdir -p /home/daaf/data/wordpress
	mkdir -p /home/daaf/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up --build 

images: docker images

up: 
	docker compose -f ./srcs/docker-compose.yml up -d
# mkdir -p ~/home/dyeboa/data/mariadb
# mkdir -p ~/home/dyeboa/data/wordpress
# docker network create app-wordpress

down: 
	docker compose -f ./srcs/docker-compose.yml down -v

clean: 
	docker compose -f ./srcs/docker-compose.yml down -v --rmi all --remove-orphans
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