#!/bin/bash
set -x

# cd /var/www/wordpress

# if [ ! -d "/run/php" ]; then
#     mkdir /run/php
# fi

# # Set up WordPress configuration
# # wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root
# echo "wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PWD --admin_email=$WP_EMAIL --allow-root" > worpress_install_log.txt
# echo "wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root" >> worpress_install_log.txt
