#!/bin/bash

LRED='\033[91m'
RED='\033[91m'
LGREEN='\033[92m'
LYELLOW='\033[93m'
LMAGENTA='\033[95m'
LCYAN='\033[96m'
NC='\033[0;39m'

ENV='srcs/.env'

echo -e "${LMAGENTA}>>> Filling the .env manually <<<${NC}"

touch ${ENV}
echo -e "	${LGREEN}>>> File ${ENV} created <<<${NC}"
echo ""
echo -e "	${LCYAN}>>> Auto filling : domain_name, mysql db name <<<${NC}"
echo "DOMAIN_NAME=ewurstei.42.fr" >> ${ENV}
echo "" >> ${ENV}

echo "#MYSQL CONFIGURATION" >> ${ENV}
echo "SQL_DB=inception" >> ${ENV}
echo -e "	${LCYAN}>>> SQL ADMIN USER PARAMETER <<<${NC}"
echo "SQL Admin user name ?"
read SQL_USER
echo "SQL_USER=$SQL_USER" >> ${ENV}
echo "SQL Admin password ?"
read SQL_PWD
echo "SQL_PWD=$SQL_PWD" >> ${ENV}
echo "SQL root password ?"
read SQL_ROOT_PWD
echo "SQL_ROOT_PWD=$SQL_ROOT_PWD" >> ${ENV} 
echo -e "	${LGREEN}>>> MYSQL admin user created <<<${NC}"
echo "" >> ${ENV}

echo "#WORDPRESS CONFIGURATION" >> ${ENV}
echo -e "	${LCYAN}>>> Wordpress admin USER <<<${NC}"
echo "Titre du site ?"
read SITE_TITLE
echo "SITE_TITLE=$SITE_TITLE" >> ${ENV}
echo "Nom de l'admin ?"
read WP_ADMIN
echo "WP_ADMIN=$WP_ADMIN" >> ${ENV}
echo "Mot de passe ?"
read WP_PWD
echo "WP_PWD=$WP_PWD" >> ${ENV}
echo "email (x@y.com)?"
read WP_EMAIL
echo "WP_EMAIL=$WP_EMAIL" >> ${ENV}
echo -e "	${LGREEN}>>> WP admin creation done <<<${NC}"
echo "" >> ${ENV}
echo ""

echo "#SECOND WP USER CONFIGURATION" >> ${ENV}
echo -e "	${LCYAN}>>> Manuel : Wordpress 2nd USER<<<${NC}"
echo "Nom de l'utilisateur ?"
read USER_NAME
echo "USER_NAME=$USER_NAME" >> ${ENV}
echo "Mot de passe ?"
read USER_PWD
echo "USER_PWD=$USER_PWD" >> ${ENV}
echo "email (x@y.com) ?"
read USER_EMAIL
echo "USER_EMAIL=$USER_EMAIL" >> ${ENV}
echo -e "	${LGREEN}>>> 2nd USER creation done <<<${NC}"
echo ""
echo -e "${LMAGENTA}>>> end of .env configuration <<<${NC}"
