# #https://www.baeldung.com/linux/nginx-docker-container
# #https://www.nginx.com/blog/deploying-nginx-nginx-plus-docker/
# #https://github.com/karthequian/docker-helloworld/blob/master/Dockerfile
# https://www.digitalocean.com/community/tutorials/how-to-configure-the-nginx-web-server-on-a-virtual-private-server

FROM nginx:bullseye

LABEL maintainer="by dyeboa"

RUN apt-get update -y && apt-get install -y nginx openssl curl

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/www/html
RUN mkdir -p /etc/nginx/conf.d	

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/key.key \
	-out /etc/nginx/ssl/crt.crt \
	-subj "/CN=dyeboa.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
