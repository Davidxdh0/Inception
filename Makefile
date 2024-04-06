NAME = v1

all: up

build: docker build -t inception:$(NAME) .

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
clean: 
	docker compose -f ./srcs/docker-compose.yml down 