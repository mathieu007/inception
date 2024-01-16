#!/bin/bash
cd /var/www/wordpress
echo "Starting WordPress on port 9000."
if [ -e "/var/www/wordpress/install.sh" ]; then
    /var/www/wordpress/install.sh > build_log.log
    rm /var/www/wordpress/install.sh
fi
if [ ! -d "/run/php" ]; then
    mkdir /run/php
fi