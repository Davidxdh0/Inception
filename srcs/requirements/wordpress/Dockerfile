FROM debian:bullseye

#Install all requiered packages.
RUN apt-get update -y && apt-get install -y \
	net-tools \
    php8.2 \
    php-mysql \
    php-fpm \
    mariadb-client \
	curl

RUN curl  https://wordpress.org/wordpress-6.5.2.tar.gz -o /var/www/wp.tar.gz
RUN tar -xzf /var/www/wp.tar.gz -C /var/www && rm /var/www/wp.tar.gz

#wp-cli https://make.wordpress.org/cli/handbook/guides/installing/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN php wp-cli.phar --info

RUN sudo mv wp-cli.phar /usr/local/bin/wp
RUN wp --info
# Create the directory for the PHP-FPM socket
RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY conf/script.sh /
COPY conf/wp-config.php /var/www/wordpress/wp-config.php

RUN chown -R www-data:www-data /var/www/wordpress \
    && find /var/www/wordpress -type d -exec chmod 755 {} \; \
    && find /var/www/wordpress -type f -exec chmod 644 {} \; \
    && chmod 777 /etc/php/8.2/fpm/pool.d/www.conf
# Copy WordPress script to the container.
# COPY ./tools/auto_config.sh .
# COPY ./conf/wp-config.php .

# Making the WordPress script runnable.
# RUN chmod +x auto_config.sh

EXPOSE 9000

# Specifies the script that's run everytime the container starts.
CMD ["bash", "/script.sh"]

# CMD ["./auto_config.sh"]