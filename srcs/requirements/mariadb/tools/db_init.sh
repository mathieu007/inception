#!/bin/bash

service mysql start

is_mysql_ready() {
    mysqladmin ping &>/dev/null
}

# Poll MySQL readiness
until is_mysql_ready; do
    echo "Waiting for MySQL to be ready..."
    sleep 1
done

echo "MySQL is ready. Executing other commands."

# Create database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${DB_WP_NAME}\`;"
# Create user and grant privileges
mysql -u root -e "CREATE USER '${DB_WP_USER}'@'%' IDENTIFIED BY '${DB_WP_PASS}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${DB_WP_NAME}\`.* TO '${DB_WP_USER}'@'%';"

# Update root password and grant privileges
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

# Create database SQL
echo "Mariadb database and users created..."
