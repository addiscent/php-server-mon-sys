#!/bin/bash
# developer tool.  Clean up and prepare for git commit
# This script must be executed with sudo/super user permissions

./delete-database.sh

./delete-phppsm.sh

chown ckt:admins ./src/etc-cron.d-tab-for-phpfpm.txt
chmod 666 ./src/etc-cron.d-tab-for-phpfpm.txt
