#https://www.baeldung.com/linux/nginx-docker-container
#https://www.nginx.com/blog/deploying-nginx-nginx-plus-docker/
#https://github.com/karthequian/docker-helloworld/blob/master/Dockerfile
FROM nginx:bookworm

RUN apt-get update
RUN apt-get add openssl
RUN apt-get add nginx

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/index.html /var/www/html/index.html
COPY srcs/style.css /var/www/html/style.css

RUN apt-get update
RUN apt-get install -y nginx openssl curl
RUN apt-get -y install libfcgi0ldbl

COPY nginx.conf /etc/nginx/sites-available/default.conf
COPY start.sh .
RUN chmod +x start.sh

RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/CN=dyeboa.42.fr"

EXPOSE 443     

ENTRYPOINT [ "./start.sh" ]

# Set the default command to execute
# when creating a new container
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

#docker build . -t inception/nginx
#docker run -d -p 443:443 inception/nginx

# FROM debian:buster
