FROM debian:buster

RUN apt update \
	&& apt upgrade -y \
	&& apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/initmysqld.sh /usr/local/bin

RUN chmod +x /usr/local/bin/initmysqld.sh

CMD [ "bash", "/usr/local/bin/initmysqld.sh" ]