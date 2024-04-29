#!bin/bash

if [ ! -d /run/mysqld ] #checks if the database is not already set up
then

	echo "Setting up MariaDB"

	# Create the run directory for mysqld
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
	chown -R mysql:mysql /var/lib/mysql

	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql #initializes database

# Creates a temporary file to store the SQL commands to be executed, creates the database and the users
cat << EOF > init.sql
	USE mysql;
	FLUSH PRIVILEGES;

	DELETE FROM mysql.user WHERE User='';
	DROP DATABASE test;
	DELETE FROM mysql.db WHERE Db='test';

	ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

	CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

	CREATE USER '$WORDPRESS_DB_USER'@'%';
	SET PASSWORD FOR '$WORDPRESS_DB_USER'@'%' = PASSWORD('$WORDPRESS_DB_PASSWORD');
	GRANT ALL PRIVILEGES ON wordpress.* TO '$WORDPRESS_DB_USER'@'%';
	GRANT ALL ON wordpress.* to '$WORDPRESS_DB_USER'@'%';
	FLUSH PRIVILEGES;

	CREATE USER '$WORDPRESS_DB_USER'@'%';
	SET PASSWORD FOR '$WORDPRESS_DB_USER'@'%' = PASSWORD('$WORDPRESS_DB_PASSWORD');
EOF

mysqld --user=mysql --bootstrap < init.sql

fi

echo "MariaDB started"

exec mysqld --user=mysql --console #starts database server in foreground