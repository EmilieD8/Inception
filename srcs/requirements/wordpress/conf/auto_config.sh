#!/bin/bash
sleep 10

cd /var/www/wordpress

# # if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD  --allow-root --dbhost=$MYSQL_HOSTNAME
    sleep 2
    wp core install --url=$DOMAIN_NAME --title=$TITLE_SITE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
    wp user create $USER_NAME $USER_EMAIL --user_pass=$USER_PASSWORD --role=author --allow-root >> /log.txt
# # fi

# if [ ! -e /var/www/wordpress/wp-config.php ]; then
#     echo "Creating wp-config.php"
#     echo "database name: $MYSQL_DATABASE"
#     sed -i "s/username_here/$MYSQL_USER/g" /var/www/wordpress/wp-config-sample.php
# 	sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
# 	sed -i "s/localhost/$MYSQL_HOSTNAME/g" /var/www/wordpress/wp-config-sample.php
# 	sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config-sample.php
# 	cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
# # fi
cd -

# if [ ! -e /var/www/wordpress/wp-config.php ]; then
#     echo "Creating wp-config.php"
#     echo "database name: $MYSQL_DATABASE"
#     sed -i "s/username_here/$MYSQL_USER/g" /var/www/wordpress/wp-config-sample.php
# 	sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
# 	sed -i "s/localhost/$MYSQL_HOSTNAME/g" /var/www/wordpress/wp-config-sample.php
# 	sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config-sample.php
# 	cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
#     echo "End of wp-config.php"
# fi

exec "$@"



# if [ ! -d /run/php ]; then
#     mkdir -p /run/php
# fi

# /usr/sbin/php-fpm7.3 -F
