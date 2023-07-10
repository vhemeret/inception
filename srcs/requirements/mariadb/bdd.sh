#!/bin/bash

set -x

service mysql start;

mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER '$SQL_ADMIN'@'%' IDENTIFIED BY '${SQL_ADMIN_PASSWORD}';"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_ADMIN}\`@'%';"

# exec mysqld