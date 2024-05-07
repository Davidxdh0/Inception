#!/bin/bash

cd /var/www/html/;
# > dev/null to hide the output of curl command, it a good practice
if [ ! -f "/var/www/html/wp-config.php" ];
then
    echo "Downloading wordpress CLI";
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null;

    chmod +x wp-cli.phar;
    mv wp-cli.phar /usr/local/bin/wp;
	
    echo "Downloading wordpress core";
	wp core download --allow-root --force

	echo "Setting up wp-config.php";
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php;

    sed -i 's/database_name_here/'$MYSQL_DATABASE'/g' /var/www/html/wp-config.php;
    sed -i 's/username_here/'$MYSQL_USER'/g' /var/www/html/wp-config.php;
    sed -i 's/password_here/'$MYSQL_PASSWORD'/g' /var/www/html/wp-config.php;
    sed -i 's/localhost/'$WORDPRESS_DB_HOST'/g' /var/www/html/wp-config.php;
	sed -i 's/"'WP_DEBUG', false"/"'WP_DEBUG', true"/g' /var/www/html/wp-config.php;
	# cat /var/www/html/wp-config.php

	echo "Installing WP core";
	wp core install --allow-root --url=$DOMAIN_NAME --title="My Inception" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL;
    wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PW --role='author';
    
fi
echo "Setting up php-fpm listen";
# cat /etc/php/7.4/fpm/pool.d/www.conf
sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.conf;

echo "WP succesfully installed & configured"

# https://stackoverflow.com/questions/32255814/what-purpose-does-using-exec-in-docker-entrypoint-scripts-serve/32261019#32261019
# executes the parameters after the script in the dockerfile at line: ENTRYPOINT ["/wp-setup.sh", "php-fpm7.4", "-F"]
# same as: php-fpm7.4 -F
exec "$@";
