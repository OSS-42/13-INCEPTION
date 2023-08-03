#!/bin/sh

wp --info
sleep 30

PHP_FILE="/run/php"
CONFIG_FILE="/var/www/wordpress/config-ok.txt"



if [ ! -e "$CONFIG_FILE" ]
then
	touch "$CONFIG_FILE"

	echo "core installing - admin user"
	wp core install --allow-root \
	--url='https://ewurstei.42.fr' \
	--title=$SITE_TITLE \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_PWD \
	--admin_email=$WP_EMAIL \
	--path='/var/www/wordpress'

	#attention recreation user 2
	echo "user creation - second user"
	wp user create --allow-root \
	$USER_NAME $USER_EMAIL \
	--role=author \
	--user_pass=$USER_PWD \
	--path='/var/www/wordpress'

	if [ ! -e "$PHP_FILE" ]
	then
		mkdir "$PHP_FILE"
	fi

	chmod 755 /var/www/wordpress 
	chown -R www-data:www-data /var/www/wordpress
fi

/usr/sbin/php-fpm7.3 -F