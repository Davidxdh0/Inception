#https://www.datacamp.com/tutorial/set-up-and-configure-mysql-in-docker
#https://exampleconfig.com/view/mariadb-ubuntu18-04-etc-mysql-mariadb-conf-d-50-server-cnf

# FROM debian:bullseye

# RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

# RUN mkdir -p /var/run/mysqld 
# RUN chown -R mysql:mysql /var/run/mysqld 
# RUN chown -R mysql:mysql /var/lib/mysql
# RUN chmod 777 /run/mysqld

# COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# COPY ./tools/setup.sh .
# RUN chmod +x setup.sh

# # COPY initdb.sql.template /docker-entrypoint-initdb.d/

# # EXPOSE 3306

# ENTRYPOINT ["bash", "./setup.sh"]

FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server nano

RUN mkdir -p /var/run/mysqld 
RUN chown -R mysql:mysql /var/run/mysqld 
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /etc/mysql

RUN chmod 777 /run/mysqld

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/setup.sh .

RUN chmod +x setup.sh

RUN chown mysql:mysql /setup.sh

# EXPOSE 3306

ENTRYPOINT ["bash", "./setup.sh"]
CMD [ "mysqld" ]