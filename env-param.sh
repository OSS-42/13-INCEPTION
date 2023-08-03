#!/bin/bash

LRED='\033[91m'
RED='\033[91m'
LGREEN='\033[92m'
LYELLOW='\033[93m'
LMAGENTA='\033[95m'
LCYAN='\033[96m'
NC='\033[0;39m'

echo -e "${LMAGENTA}>>> Filling the srcs/.env manually <<<${NC}"

touch srcs/.env
echo -e "	${LGREEN}>>> File srcs/.env created <<<${NC}"
echo ""
echo -e "	${LCYAN}>>> Auto filling : domain_name, mysql admin user <<<${NC}"
echo "DOMAIN_NAME=ewurstei.42.fr" >> srcs/.env
echo "" >> srcs/.env

echo "#MYSQL CONFIGURATION" >> srcs/.env
echo "SQL_DB=inception" >> srcs/.env
echo "SQL_USER=the_continental" >> srcs/.env
echo "SQL_PWD=goldcoin" >> srcs/.env
echo "SQL_ROOT_PWD=the_manager" >> srcs/.env
echo -e "	${LGREEN}>>> MYSQL admin user created <<<${NC}"
echo "" >> srcs/.env
echo -e "	${LGREEN}>>> AUTO Filling done$ <<<${NC}"
echo ""

echo "#WORDPRESS CONFIGURATION" >> srcs/.env
echo -e "	${LCYAN}>>> Manual : Wordpress admin USER <<<${NC}"
echo "Titre du site ?"
read SITE_TITLE
echo "SITE_TITLE=$SITE_TITLE" >> srcs/.env
echo "Nom de l'admin ?"
read WP_ADMIN
echo "WP_ADMIN=$WP_ADMIN" >> srcs/.env
echo "Mot de passe ?"
read WP_PWD
echo "WP_PWD=$WP_PWD" >> srcs/.env
echo "email (x@y.com)?"
read WP_EMAIL
echo "WP_EMAIL=$WP_EMAIL" >> srcs/.env
echo -e "	${LGREEN}>>> WP admin creation done <<<${NC}"
echo "" >> srcs/.env
echo ""

echo "#SECOND WP USER CONFIGURATION" >> srcs/.env
echo -e "	${LCYAN}>>> Manuel : Wordpress 2nd USER<<<${NC}"
echo "Nom de l'utilisateur ?"
read USER_NAME
echo "USER_NAME=$USER_NAME" >> srcs/.env
echo "Mot de passe ?"
read USER_PWD
echo "USER_PWD=$USER_PWD"
echo "email (x@y.com) ?"
read USER_EMAIL
echo "USER_EMAIL=$USER_EMAIL" >> srcs/.env
echo -e "	${LGREEN}>>> 2nd USER creation done <<<${NC}"
echo ""
echo -e "${LMAGENTA}>>> end of srcs/.env configuration <<<${NC}"
