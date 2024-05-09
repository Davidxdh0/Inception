FROM debian:bullseye

RUN apt-get update -y && apt-get install -y \
	nano \
	php \
	php-curl \
	php-mysql \
	php-fpm \
	curl

RUN mkdir -p /run/php
RUN mkdir -p /var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY ./tools/wp-setup.sh /wp-setup.sh

RUN chmod +x /wp-setup.sh

ENTRYPOINT ["/wp-setup.sh"]