# #https://www.baeldung.com/linux/nginx-docker-container
# #https://www.nginx.com/blog/deploying-nginx-nginx-plus-docker/
# #https://github.com/karthequian/docker-helloworld/blob/master/Dockerfile

FROM nginx:bullseye

LABEL maintainer="by dyeboa"

RUN apt-get update -y && apt-get install -y nginx openssl curl

RUN mkdir -p /var/run/nginx
RUN mkdir -p /etc/nginx/ssl

COPY nginx.conf /etc/nginx/nginx.conf

# COPY ./index.html /var/www/wordpress/index.html
# COPY ./style.css /var/www/wordpress/style.css

# RUN chmod 644 /var/www/wordpress/index.html && \
#     chmod 644 /var/www/wordpress/style.css

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/key.key -out /etc/nginx/ssl/crt.crt -subj "/CN=dyeboa.42.fr"

EXPOSE 443 

# Set the default command to execute
# when creating a new container
CMD ["nginx", "-g", "daemon off;"]
