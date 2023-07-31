# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ewurstei <ewurstei@student.42quebec.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/27 21:38:15 by ewurstei          #+#    #+#              #
#    Updated: 2023/07/27 21:39:06 by ewurstei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update \
	&& apt upgrade -y \
	&& apt install nginx -y \
	&& apt install vim -y \
	&& apt install curl -y \
	&& mkdir -p /etc/nginx/ssl \
	&& apt install openssl -y \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CA/ST=Quebec/L=Quebec/O=42/OU=42/CN=ewurstei.42.fr/UID=ewurstei"

RUN mkdir -p /var/run/nginx
	#&& chmod 755 /var/www/wordpress 
	#&& chown -R www-data:www-data /var/www/wordpress

COPY conf/nginx.conf /etc/nginx/

CMD [ "nginx", "-g", "daemon off;" ]