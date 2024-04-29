FROM debian:bullseye

#Install all requiered packages.
RUN apt-get update -y && apt-get install -y \
	# net-tools 
    php \
    php-mysql \
    php-fpm \
    mariadb-server \
	curl

RUN mkdir -p /var/www && \
	curl  https://wordpress.org/wordpress-6.5.2.tar.gz -o /var/www/wp.tar.gz
RUN tar -xzf /var/www/wp.tar.gz -C /var/www && rm /var/www/wp.tar.gz

#wp-cli https://make.wordpress.org/cli/handbook/guides/installing/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN php wp-cli.phar --info

RUN mv wp-cli.phar /usr/local/bin/wp
# RUN wp --info
# # Create the directory for the PHP-FPM socket
# RUN mkdir -p /run/php
RUN mkdir -p /var/www/wordpress
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
# COPY conf/script.sh /
COPY conf/wp-config.php /var/www/wordpress/wp-configs.php

RUN chown -R www-data:www-data /var/www/wordpress && \
    find /var/www/wordpress -type d -exec chmod 755 {} \; && \
    find /var/www/wordpress -type f -exec chmod 644 {} \; && \
    chmod 777 /etc/php/7.4/fpm/pool.d/www.conf
# Copy WordPress script to the container.
COPY ./tools/auto_config.sh .
# COPY ./conf/wp-config.php .

# Making the WordPress script runnable.

EXPOSE 8080

# Specifies the script that's run everytime the container starts.
# CMD ["bash", "/script.sh"]
# CMD ["/bin/bash"]
RUN chmod +x auto_config.sh
CMD ["./auto_config.sh"]
# ENTRYPOINT ["bash", "auto_config.sh"]
