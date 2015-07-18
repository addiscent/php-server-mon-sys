#!/bin/bash
echo "Stopping Php-Server-Mon-Sys..."
docker-compose stop
echo "Deleting PHP Server Monitor database"
rm -rf ./mysql/mysql-db
echo "PHP Server Monitor database deleted"
