FROM debian:buster

RUN apt update \
	&& apt upgrade -y \
	&& apt install -y wget php7.3 php-fpm php-mysql mariadb-client -y
RUN wget https://wordpress.org/wordpress-6.2.2.tar.gz -P /var/www
RUN cd /var/www \
	&& tar -xvf wordpress-6.2.2.tar.gz \
	&& rm wordpress-6.2.2.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp