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