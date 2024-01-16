#!/bin/bash
echo "Starting mariadb."

# Start MySQL in the background
exec mysqld_safe --user=root --foreground --skip-networking

# Wait until MySQL is ready to accept connections
until mysqladmin ping &> /dev/null; do
    echo "Waiting for MySQL to be ready..."
    sleep 1
done

echo "MySQL is ready. Executing additional setup if needed."

sleep 100000
