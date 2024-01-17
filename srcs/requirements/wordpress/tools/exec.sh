#!/bin/bash
service php8.1-fpm start

if wp core is-installed --allow-root --path="/var/www/wordpress"; then
    echo "WordPress is already installed. Skipping installation."
else
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
fi

service php8.1-fpm stop

exec php-fpm8.1 -F -R
