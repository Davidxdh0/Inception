#!bin/bash

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]
then
	service mariadb start;
	sleep 3
    echo "Creating database: ${MYSQL_DATABASE}"

    mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
    mysql -e "CREATE USER IF NOT EXISTS  \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
	service mariadb stop;
fi

echo "exec(mysqld)"
exec mysqld

# mysql -h 127.0.0.1 -P 3306 -u testuser -p --database=wordpress_data
# mysql -h 127.0.0.1 -P 3306 -u root -p
# testpw
# \s - status
# \g - send command
# SHOW DATABASES;
# use wordpress_data
# SHOW GRANTS FOR CURRENT_USER;
