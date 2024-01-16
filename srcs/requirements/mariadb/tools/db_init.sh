#!/bin/bash

set -x
service mysql start

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
echo "CREATE DATABASE IF NOT EXISTS \`${DB_WP_NAME}\`;" > database_setup.sql

# Create user and grant privileges SQL
echo "CREATE USER '${DB_WP_USER}'@'%' IDENTIFIED BY '${DB_WP_PASS}';" >> database_setup.sql
echo "GRANT ALL PRIVILEGES ON \`${DB_WP_NAME}\`.* TO '${DB_WP_USER}'@'%';" >> database_setup.sql

# Update root password and grant privileges SQL
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';" >> database_setup.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> database_setup.sql
echo "FLUSH PRIVILEGES;" >> database_setup.sql

# echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > web.sql
# echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> web.sql
# echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> web.sql
# # echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '123456' ;" >> web.sql
# # echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION ;" >> web.sql
# echo "FLUSH PRIVILEGES;" >> web.sql

#restart mariadb server
#look in default .cnf configuration file for pid location
# kill $(cat /var/run/mysqld/mysqld.pid)
