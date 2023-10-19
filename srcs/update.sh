#!/bin/bash

# Update Nginx
docker-compose -f /home/daaf/docker/nginx/docker-compose.yml pull
docker-compose -f /home/daaf/docker/nginx/docker-compose.yml down
docker-compose -f /home/daaf/docker/nginx/docker-compose.yml up -d --remove-orphans

# Update MariaDB
docker-compose -f /home/daaf/docker/mariadb/docker-compose.yml pull
docker-compose -f /home/daaf/docker/mariadb/docker-compose.yml down
docker-compose -f /home/daaf/docker/mariadb/docker-compose.yml up -d --remove-orphans

# Update wordpress
docker-compose -f /home/daaf/docker/wordpress/docker-compose.yml pull
docker-compose -f /home/daaf/docker/wordpress/docker-compose.yml down
docker-compose -f /home/daaf/docker/wordpress/docker-compose.yml up -d --remove-orphans