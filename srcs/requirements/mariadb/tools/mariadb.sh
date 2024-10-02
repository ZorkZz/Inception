#!/bin/bash
# Attend que MariaDB soit prêt
service mariadb start

while ! mysqladmin ping -h"localhost" --silent; do
    sleep 1
done


mysql -u root -p << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$USER_NAME'@'%' IDENTIFIED BY '$USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER_NAME'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'zizi';
EOF


exec "$@"