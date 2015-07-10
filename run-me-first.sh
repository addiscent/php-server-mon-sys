#!/bin/bash

# you must have super user permissions to execute this file,
# (use sudo or otherwise become super user)

echo "This will take a short while..."

# docker will skip downloading these files if they already exist
# on this host
docker pull nginx:1.9.2 && \
docker pull nmcteam/php56:1.0 && \
docker pull mysql:5.7.7 && \

# unzip the PHP Server Monitor sub-directory tree
tar -zxvf phpservermon-3.1.1.tar.gz -C ./src/public/ && \

echo && \
echo "Still working, almost done..." && \

mv ./src/public/phpservermon-3.1.1 ./src/public/phpservermon && \
chmod -R 755 ./src/public && \

# file permissions fiddling is necessary to for a legit crontab
chmod 600 ./src/etc-cron.d-tab-for-phpfpm.txt && \
chown root:root ./src/etc-cron.d-tab-for-phpfpm.txt && \

# config.php must be writable, but must not be executable
touch ./src/public/phpservermon/config.php && \
chmod 666 ./src/public/phpservermon/config.php && \

# this is where the PHP Server Monitor mysql database lives
if [ ! -d "mysql-db" ]
then
  mkdir ./mysql-db
fi

echo "Installation complete"
echo
