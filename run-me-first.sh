#!/bin/bash
# file permissions fiddling is necessary to for a legit crontab
chmod 600 ./src/etc-cron.d-tab-for-phpfpm.txt
chown root:root ./src/etc-cron.d-tab-for-phpfpm.txt
