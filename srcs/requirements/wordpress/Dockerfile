# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ewurstei <ewurstei@student.42quebec.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/27 21:46:16 by ewurstei          #+#    #+#              #
#    Updated: 2023/07/27 21:53:19 by ewurstei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update \
	&& apt upgrade -y \
	&& apt install -y wget php7.3 php-fpm php-mysql mariadb-client
RUN wget https://wordpress.org/wordpress-6.2.2.tar.gz -P /var/www
RUN cd /var/www \
	&& tar -xzf wordpress-6.2.2.tar.gz \
	&& rm wordpress-6.2.2.tar.gz

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY /conf/auto-config.sh /usr/local/bin
COPY /conf/wp-config.php /var/www/wordpress

RUN chmod +x /usr/local/bin/auto-config.sh
RUN chmod 777 /var/www/wordpress/wp-config.php

EXPOSE 9000

ENTRYPOINT [ "bash", "/usr/local/bin/auto-config.sh" ]
