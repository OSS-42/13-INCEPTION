#!/bin/sh

sleep 15
FILE="/var/www/wordpress/wp-config.php"
PHP_FILE="/run/php"

if [ ! -f "$FILE" ]
then
	wp config create --allow-root \
	--dbname=$SQL_DB \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PWD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core download --allow-root # RETRAIT
	wp core install --title=$SITE_TITLE \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_PWD \
	--admin-email=$WP_EMAIL

	wp user create --allow-root \
	$USER_NAME $USER_EMAIL \
	--role=author \
	--user_pass=$USER_PWD

fi

if [ ! -e "$PHP_FILE" ]
then
	mkdir "$PHP_FILE"
fi

# exec /usr/sbin/php-fpm7.3 -F
/usr/sbin/php-fpm7.3 -F