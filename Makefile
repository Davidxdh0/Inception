all: up

build: 

up: docker-compose -f ./srcs/docker-compose.yml up -d

clean: