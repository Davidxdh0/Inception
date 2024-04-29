NAME = v1

all: clean build up

build: 
	docker compose -f ./srcs/docker-compose.yml up --build -d

images: docker images

up: 
	docker compose -f ./srcs/docker-compose.yml up -d
# mkdir -p ~/home/dyeboa/data/mariadb
# mkdir -p ~/home/dyeboa/data/wordpress
# docker network create app-wordpress
	
restart: clean build up

down: 
	docker compose -f ./srcs/docker-compose.yml down -v

clean: 
	docker compose -f ./srcs/docker-compose.yml down -v
#	docker stop $(docker ps -a -q)

cclean:
	docker system prune -af
#docker volume rm $(docker volume ls -qf dangling=true)
ps: 
	docker ps
cls: 
	docker container ls

# find /var/www/wordpress -type d -exec chmod 755 {} \;
# find /var/www/wordpress -type f -exec chmod 644 {} \;