#https://www.baeldung.com/linux/nginx-docker-container
#https://www.nginx.com/blog/deploying-nginx-nginx-plus-docker/
#https://github.com/karthequian/docker-helloworld/blob/master/Dockerfile
FROM nginx:latest

RUN apt-get -y update && apt-get -y install nginx

COPY index.html /usr/share/nginx/html
COPY linux.png /usr/share/nginx/html

EXPOSE 443     

# Set the default command to execute
# when creating a new container
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

#docker build . -t inception/nginx
#docker run -d -p 443:443 inception/nginx