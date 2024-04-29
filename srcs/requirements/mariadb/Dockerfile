FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client procps gettext-base

COPY 50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY setup.sh /
COPY initdb.sql.template /docker-entrypoint-initdb.d/

RUN chmod +x setup.sh

ENTRYPOINT ["bash", "setup.sh"]