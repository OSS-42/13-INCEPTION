# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ewurstei <ewurstei@student.42quebec.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/27 21:46:23 by ewurstei          #+#    #+#              #
#    Updated: 2023/07/27 21:46:24 by ewurstei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update \
	&& apt upgrade -y \
	&& apt install mariadb-server -y \
	&& mkdir -p var/run/mysqld \
	&& chown -R mysql:mysql var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY conf/initmysqld.sh /usr/local/bin

RUN chmod +x /usr/local/bin/initmysqld.sh

# Ajout
EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/initmysqld.sh" ]
