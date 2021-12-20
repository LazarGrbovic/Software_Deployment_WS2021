#!/bin/bash

set -eu

DB_ROOT_PASS=${DB_ROOT_PASS:-root}

DB_NAME=${DB_NAME:-wpdb}
DB_USER=${DB_USER:-lazar}
DB_PASS=${DB_PASS:-password}

/usr/bin/mysqld_safe &

sleep 5

/usr/bin/mysqladmin -u root password ${DB_ROOT_PASS}

SQL1="create database ${DB_NAME}";
echo $SQL1
mysql -u root -p${DB_ROOT_PASS} -e "${SQL1}"

SQL2="grant select,update,insert,delete ON \`${DB_NAME}\`.* to \"${DB_USER}\"@\"%\" identified by \"${DB_PASS}\";"
echo $SQL2
mysql -u root -p${DB_ROOT_PASS} -e "${SQL2}"
mysqladmin -u root -p${DB_ROOT_PASS} shutdown

exec /usr/bin/mysqld_safe
