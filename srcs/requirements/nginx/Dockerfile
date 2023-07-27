FROM debian:buster

RUN apt update \
	&& apt upgrade -y \
	&& apt install nginx -y \
	&& apt install vim -y \
	&& apt install curl -y \
	&& mkdir -p /etc/nginx/ssl \
	&& apt install openssl -y \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CA/ST=Quebec/L=Quebec/O=42/OU=42/CN=ewurstei.42.fr/UID=ewurstei" \
	&& mkdir -p /var/run/nginx \
	&& chmod 755 /var/www/wordpress \
	&& chown -R www-data:www-data /var/www/wordpress

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]