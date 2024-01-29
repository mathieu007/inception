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
# echo "CREATE DATABASE IF NOT EXISTS \`${DB_WP_NAME}\`;" > database_setup.sql

# # Create user and grant privileges SQL
# echo "CREATE USER '${DB_WP_USER}'@'%' IDENTIFIED BY '${DB_WP_PASS}';" >> database_setup.sql
# echo "GRANT ALL PRIVILEGES ON \`${DB_WP_NAME}\`.* TO '${DB_WP_USER}'@'%';" >> database_setup.sql

# # Update root password and grant privileges SQL
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';" >> database_setup.sql
# echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> database_setup.sql
# echo "FLUSH PRIVILEGES;" >> database_setup.sql
