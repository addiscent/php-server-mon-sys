#!/bin/bash
# backup the entire Php-Server-Mon-Sys directory tree, including database

date_formatted=$(date +%Y.%m%d.%H%M)
echo "Date and Time of this backup : " $date_formatted

echo "Stopping Php-Server-Mon-Sys..."
docker-compose stop

echo "Backup filename:  php-server-mon-sys.$date_formatted.tar.gz"
tar -zcvf php-server-mon-sys.$date_formatted.tar.gz *

echo "Backed-up to:  php-server-mon-sys.$date_formatted.tar.gz"

echo "Re-starting Php-Server-Mon-Sys..."
docker-compose up -d
