#!/bin/bash
# Clean home dir for re-install, or before commit of project files.
# This script is typically used by a developers, not normally needed by users.
# This script must be executed with sudo/superuser permissions

# WARNING: This script will delete the PSMS database

echo "WARNING: This script will delete the PSMS database!"
echo "Press CTRL-C to exit, or <ENTER> to continue..."
read $1

if [ -d "./mysql-db" ]
then
  ./delete-database.sh
fi

if [ -d "./phpservermon-3.1.1" ]
then
  rm -rf ./phpservermon-3.1.1
fi
