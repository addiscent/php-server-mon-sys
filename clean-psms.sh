#!/bin/bash
# Clean up home dir for install/re-install, (or before commit of project files)
# This script must be executed with sudo/super user permissions

if [ -d "./mysql-db" ]
then
  ./delete-database.sh
fi

if [ -d "./src/public/phpservermon" ]
then
  ./delete-phppsm.sh
fi

if [ -d "./src/etc-cron.d-tab-for-phpfpm.txt" ]
then
  chown ckt:admins ./src/etc-cron.d-tab-for-phpfpm.txt
  chmod 666 ./src/etc-cron.d-tab-for-phpfpm.txt
fi
