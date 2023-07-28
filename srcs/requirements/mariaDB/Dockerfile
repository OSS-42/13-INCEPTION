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
	&& apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/initmysqld.sh /usr/local/bin

RUN chmod +x /usr/local/bin/initmysqld.sh

ENTRYPOINT [ "bash", "/usr/local/bin/initmysqld.sh" ]

# Ajout
EXPOSE 3306