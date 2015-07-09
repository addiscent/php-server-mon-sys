#!/bin/bash
# Reset the PHP Server Monitor config.php file so that PSM will perform
# the installation procedure again, (install.php).
# The existing config.php file is saved into config-php.backup.

# WARNING: The previous config-php.backup file is overwritten.

# This script must be executed from the directory where it lives.

mv -f ./src/public/phpservermon/config.php ./src/public/phpservermon/config-php.backup \
&& touch ./src/public/phpservermon/config.php \
&& chmod 766 ./src/public/phpservermon/config.php
