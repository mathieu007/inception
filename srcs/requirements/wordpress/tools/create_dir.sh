#!/bin/bash
cd /var/www/wordpress
if [ -e "/var/www/wordpress/install.sh" ]; then
    /var/www/wordpress/install.sh
    rm /var/www/wordpress/install.sh
fi