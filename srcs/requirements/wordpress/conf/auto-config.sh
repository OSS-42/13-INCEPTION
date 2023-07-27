#!/bin/sh

sleep 15
FILE="/var/www/wordpress/wp-config.php"

if [ ! -f "$FILE" ]
then
	wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'
fi
