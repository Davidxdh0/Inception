NAME = v1

all: up

build: docker build -t inception:$(NAME) .

images: docker images

up: docker compose -f ./srcs/docker-compose.yml up -d
# mkdir -p ~/home/dyeboa/data/mariadb
# mkdir -p ~/home/dyeboa/data/wordpress
# docker network create app-wordpress
	

clean: 
	docker compose -f ./srcs/docker-compose.yml down 

cclean: 
	docker compose --volumes -f ./srcs/docker-compose.yml down

1: docker image history $(NAME)
2: docker image history --no-trunc $(NAME)
ps: Docker ps
listcontainers: docker container ls

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
