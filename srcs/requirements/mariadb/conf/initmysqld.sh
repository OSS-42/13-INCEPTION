#!/bin/sh

#Demarrage de mysql
#service mysql start;
mysqld

#Demarrage de mysql in background (&)
#mysqld &
# Get process ID
#pid="$!"

sleep 10

#Creation de la table
mysql -u root -p$SQL_ROOT_PWD -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;"
#Creation des utilisateurs
mysql -u root -p$SQL_ROOT_PWD -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PWD}';"
#Je donne les droits a l<utilisateur
mysql -u root -p$SQL_ROOT_PWD -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWD}';"
#Changement du root 
mysql -u root -p$SQL_ROOT_PWD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';"
#Refresh des droits
mysql -u root -p$SQL_ROOT_PWD -e "FLUSH PRIVILEGES;"

#mysqladmin -u root -p$SQL_ROOT_PWD shutdown
#mysqladmin -u root -p$SQL_ROOT_PWD -S /var/run/mysqld/mysqld.sock shutdown

#exec mysqld

# Wait for MariaDB to finish
#wait "$pid"
tail -f /dev/null