#!/bin/sh

#Demarrage de mysql
service mysql start;

#Creation de la table
mysql -e "CREATE DB IF NOT EXISTS \`${SQL_DB}\`;"
#Creation des utilisateurs
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PWD}';"
#Je donne les droits a l<utilisateur
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWD}';"
#Changement du root 
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';"
#Refresh des droits
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PWD shutdown

exec mysqld_safe