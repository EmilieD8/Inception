#!/bin/bash

MYSQL_HOSTNAME="mariadb"
MYSQL_DATABASE="inception"
MYSQL_USER="edrouot"
MYSQL_PASSWORD="incep_pass123"
MYSQL_ROOT_PASSWORD="incep_root_pass123"

service mysql start;
echo "Data base creation..."

mysql_status=$(service mysql status)

# Echo the status
echo "MySQL Status: $mysql_status"
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# mysql -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}_name\`.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql -h localhost -u root -p"$MYSQL_ROOT_PASSWORD" < db1.sql
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

mysql_status=$(service mysql status)

# Echo the status
echo "MySQL Status: $mysql_status"

#mysqld
# exec mysqld_safe