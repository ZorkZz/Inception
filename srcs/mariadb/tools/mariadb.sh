#!/bin/bash
# Attend que MariaDB soit prêt
service mariadb start

while ! mysqladmin ping -h"localhost" --silent; do
    sleep 1
done