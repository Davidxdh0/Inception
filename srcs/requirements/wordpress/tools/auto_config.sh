#!/bin/bash

# Check if WordPress is installed by attempting to connect to the database
# and checking if the 'wp_users' table has any entries.

mkdir -p /var/www/
mkdir -p /var/www/wordpress

rm -f /var/www/wordpress/wp-config.php

if [ ! -f /var/www/wordpress/wp-config.php ]; then

	cd /var/www/wordpress

	#Download and configure WP-CLI
	# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

	# chmod +x wp-cli.phar

	# mv wp-cli.phar /usr/local/bin/wp

	#Dowload WordPress core
	wp core download --allow-root --force

	mv /var/www/wordpress/wp-configs.php /var/www/wordpress/wp-config.php


	# sed -i -r "s/database/$MYSQL_PASSWORD/1" 			wp-config.php
	# sed -i -r "s/user/$MYSQL_USER/1" 		wp-config.php
	# sed -i -r "s/user_pwd/$WORDPRESS_DB_PASSWORD/1" wp-config.php

	#Install WordPress with first (admin) user.
	# wp core install --allow-root --url=dyeboa.42.fr --title=dyeboa.42.fr --admin_user=testuser --admin_email=grietjemoeder@gmail.com --admin_password=testpw
	wp core install --allow-root --url=$DOMAIN_NAME --title=$DOMAIN_NAME --admin_user=$WORDPRESS_DB_USER --admin_password=$USER1 --admin_email=$EMAIL
	echo "Created wp-config.php file ..."

	#Create Second User
	wp user create $USER2 user2-test@42.fr --allow-root --user_pass=$USER2_PW

	# Ensure correct ownership and permissions
    chown -R www-data:www-data /var/www/wordpress
    find /var/www/wordpress -type d -exec chmod 755 {} \;
    find /var/www/wordpress -type f -exec chmod 644 {} \;

	# Configure to to listen to port '9000' instead of a local socket
	sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.3/fpm/pool.d/www.conf

fi

echo "WordPress initialized and started..."

/usr/sbin/php-fpm7.4 -F