all: up

build:

test: image
	docker compose -f ./srcs/docker-compose.yml up -d
test1: image
	docker compose -f ./srcs/docker-compose1.yml up -d

image: clean
	mkdir -p ~/home/dyeboa/data/mariadb
	mkdir -p ~/home/dyeboa/data/wordpress
# config to directory
# download cli for wordpress - mv - chmod
	docker network create inception-wordpress

clean: 
	docker compose -f ./srcs/docker-compose.yml down
	docker network rm -f inception-wordpress

reset:
	docker image prune -a
	sudo rm -rf ~/home/dyeboa/data/mariadb
	sudo rm -rf ~/home/dyeboa/data/wordpress