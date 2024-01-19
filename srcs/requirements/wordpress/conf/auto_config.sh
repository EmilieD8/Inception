#!/bin/bash

sleep 20

cd /var/www/wordpress
	
wp core config --dbhost=$MYSQL_HOSTNAME --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD --allow-root

wp core install --title=$TITLE_SITE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS \
	--admin_email=$ADMIN_MAIL --url=$DOMAIN_NAME --allow-root

wp user create $MYSQL_USER $USER_MAIL --role=author --user_pass=$MYSQL_PASSWORD --allow-root


/usr/sbin/php-fpm7.3 -F
