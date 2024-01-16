#!/bin/bash
set -x

cd /var/www/wordpress

# Set up WordPress configuration
# wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root
# echo "wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PWD --admin_email=$WP_EMAIL --allow-root" > worpress_install_log.txt
# echo "wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root" >> worpress_install_log.txt

service php8.1-fpm start

{
  wp core install \
    --url="$DOMAIN_NAME" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PWD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root \
    --path="/var/www/wordpress"

  # Create an additional user with 'author' role
  wp user create "$WP_USER" "$WP_EMAIL" \
    --role=author \
    --user_pass="$WP_PWD" \
    --allow-root \
    --path="/var/www/wordpress"
} 
# 2>&1 | tee -a wordpress_install_log.txt

service php8.1-fpm stop
