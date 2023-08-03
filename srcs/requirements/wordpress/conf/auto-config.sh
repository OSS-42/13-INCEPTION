#!/bin/sh

wp --info
sleep 30

PHP_FILE="/run/php"

	# wp core download --allow-root \# RETRAIT
	# --path='/var/www/wordpress'

# 	wp config create --allow-root \
# 	--dbname=$SQL_DB \
# 	--dbuser=$SQL_USER \
# 	--dbpass=$SQL_PWD \
# #	--dbhost=mariadb:3306 \
# 	--path='/var/www/wordpress'

echo "core installing - admin user"
wp core install --allow-root \
--url='https://ewurstei.42.fr' \
--title=$SITE_TITLE \
--admin_user=$WP_ADMIN \
--admin_password=$WP_PWD \
--admin_email=$WP_EMAIL \
--path='/var/www/wordpress'

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

# exec /usr/sbin/php-fpm7.3 -F
/usr/sbin/php-fpm7.3 -F