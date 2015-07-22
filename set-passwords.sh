#!/bin/bash
# set passwords in appropriate files

if [ "$1 " == " " ] || [ "$2 " == " " ]; then
  echo "Error: set-passwords.sh requires two arguments"
  echo "Usage: set-passwords.sh root_password user_password"
  exit 1
fi

echo "Setting root password to: $1"
echo "Setting user password to: $2"
echo "Press [ENTER] to confirm, or CTRL-C to abandon:"
read
sed -i "s/MYSQL_ROOT_PASSWORD=mysecretpassword/MYSQL_ROOT_PASSWORD=$1/g" ./docker-compose.yml && \
sed -i "s/MYSQL_PASSWORD=phpservermon/MYSQL_PASSWORD=$2/g" ./docker-compose.yml && \
sed -i "s/define('PSM_DB_PASS', 'phpservermon');/define('PSM_DB_PASS', '$2');/g" ./php-fpm/psm_config.php && \
echo "Password for root set to: $1"
echo "Password for user set to: $2"
echo "New passwords will not take effect until after next four steps:"
echo "  - PHP-FPM container is re-built,(./build-php-fpm.sh)"
echo "  - Database is deleted, (sudo ./delete-database.sh)"
echo "  - Obsolete PHP-FPM container is unloaded, (docker-compose rm)"
echo "  - Php-Server-Mon-Sys is re-started, (docker-compose up -d)"
