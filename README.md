# Php-Server-Mon-Sys
#### Why _Php-Server-Mon-Sys_?
Let's say you manage some websites or other network servers, and you wish to monitor them.  You decide it's time to install and operate a _Server Monitor_ to help with that task.  There are quite a number of _server monitors_ available from which to choose.  At this time you choose a server monitor named _PHP Server Monitor_:

- http://phpservermonitor.org/

- http://www.phpservermonitor.org/support/

- https://github.com/phpservermon/phpservermon

However, you _may_ now have a significant problem, a problem common to many _server monitors_.  The problem is, _PHP Server Monitor_ installation may be very complicated and time consuming.  _Php-Server-Mon-Sys_ solves this problem.  In many cases, _Php-Server-Mon-Sys_ makes installation of _PHP Server Monitor_ much faster and simpler.

#### What is complicated about _PHP Server Monitor_ installation?
_PHP Server Monitor_ installation itself is not terribly complicated.  But, _PHP Server Monitor_ is dependent on several other services for its operation, including an HTTP server, a MySQL server, and a PHP-FPM server.  In order to operate _PHP Server Monitor_, those services must be installed on the _PHP Server Monitor's_ host system.  However, on many OS installations, those services are not already installed.  Unless installation of _PHP Server Monitor_ is performed by a qualified system administrator, installing those services is error-prone and time consuming.

#### _Php-Server-Mon-Sys_ Is A _Turnkey_ System
_Php-Server-Mon-Sys_ significantly reduces the complexity of _PHP Server Monitor_ installation, on host computers which do not already have the required support services installed.  In addition to installing _PHP Server Monitor_, _Php-Server-Mon-Sys_ also installs NGINX, MySQL, and PHP-FPM, as "private" services which are available only to _PHP Server Monitor_.  These services are not installed directly into the host operating system per usual.  The services are deployed using _Docker_ containers, which means the new services may be very easily installed and un-installed along with the _PHP Server Monitor_ application software.

By using _Docker_ containers and a straightforward isolated sub-directory tree implementation, the services and application do not become "entangled" in the native operating system, nor yet another cause of conflict with other application software installed on the host.  If you no longer need the _PHP Server Monitor_ software in your system, you may very easily remove it.  When it is removed, _PHP Server Monitor's_ supporting services are removed as well.  There is no need to individually remove each of the other services no longer needed.

Keep in mind that the NGINX, MySQL, and PHP-FPM services which are installed by _Php-Server-Mon-Sys_ are available only to _PHP Server Monitor_; they are not intended to be available to other application software on the host system.  The services are _ephemeral_; they come and go along with the installation, operation, and un-installation of _Php-Server-Mon-Sys_.

The version of _PHP Server Monitor_ incorporated into this release of _Php-Server-Mon-Sys_ is _PHP Server Monitor v3.1.1_.

This version of _Php-Server-Mon-Sys_, _v0.0.5_, has been tested only on a host using _Ubuntu 14.04_.  _Php-Server-Mon-Sys_ has not yet been tested on _OS X_ nor _Windows_.  Theoretically, _Php-Server-Mon-Sys_ should work on any host which fully supports _Docker_ tools, but that has not been proven firsthand.

### System Requirements
Installation and operation of _Php-Server-Mon-Sys_ requires:

  - 500MB available memory
  - 1GB available storage, (plus server history data accumulated in database)
  - Internet connection/service
  - Docker Engine 1.7, pre-installed
  - Docker Compose 1.3.1, pre-installed

### _Php-Server-Mon-Sys_ Installation Instructions
1. Download the v0.0.5 release tar.gz or .zip file into a convenient newly created directory, which will be used as the _Php-Server-Mon-Sys_ "Home" directory. Untar/unzip the release file, (keep dir structure).

  - https://github.com/addiscent/php-server-mon-sys/releases/tag/v0.0.5

2. $ sudo ./install-psms.sh  # sudo on debian, or superuser permissions on whatever

3. $ docker-compose up -d  # wait two minutes for mysql to finish initializing database

IMPORTANT: You must wait, (approximately two minutes), for MySQL to finish initializing its database before continuing with _PHP Server Monitor_ Initialization instructions below.  Otherwise, you will receive errors during the _PHP Server Monitor_ Initialization process, and you will need to restart installation from step 2 above.

### _PHP Server Monitor_ Initialization
- Use a web browser, visit:

    * http://localhost:28684/phpservermon/

- Read and follow the directions on the first page, then choose _LET'S GO_.

- For each field, enter these values:

    * _Database host_ : _mysqlpsm_

    * _Database name_ : _phpservermon_

    * _Database user_ : _phpservermon_

    * _Database password_ : _phpservermon_

    * _Table prefix_ : psm_

    * Choose _SAVE CONFIGURATION_

    * Choose _SAVE CONFIGURATION_, (a second time, for confirmation)

- Set your user, password, and email to whatever you wish, then choose _INSTALL_.

- Read the page, follow the instructions, then choose _GO TO YOUR MONITOR_

### Quick-start Guide To _PHP Server Monitor_ Operation
- Enter your user credentials and choose _LOGIN_.  A page shows _STATUS_.  The page is currently blank, because no servers have been chosen for monitoring.

- Enter a server to monitor, and watch it, as described here:

    * Choose _Servers_ from the menu at the top of the page. The next page shows _Servers_ page.

    * Choose the green _ADD NEW_ button.  Enter the appropriate data into the fields, for a server you wish to monitor, then choose _SAVE_.

    * The _Servers_ page refreshes, and now the server you entered on the previous page is in the list of servers to be monitored.  Choose _Status_ from the menu at the top of the page.

    * Notice a green box containing the name of the server you have chosen to be monitored.  This page has several means of being refreshed to show the current status of the server.  Let's use the _manual update_ method now.  Choose _Update_ from the menu at the top of the page.

    * The contents of the green named-server box changes to _"Last online: a second ago"_. Now, let's see a chart of the server's uptime history.  Mouse-click on the green box containing your server's name.

    * A page titled _Servers_ shows your server's profile information, and charts containing the access history of the chosen server.  At this time, there is only one or a few points on the graph.  Each point reflects the server's status at that time.  The server's access history is updated _in the database_, a data point every three minutes, (default).  However, the chart on this page does not automatically update, it must be refreshed manually, (using browser page refresh).

    * Let's change the configuration of _PHP Server Monitor_ so that the main home page, _Status_, is automatically refreshed periodically, so you don't have to do it manually.  Choose _Config_ from the menu at the top of the page.  A page titled _Config_ is shown.   In the field titled _Auto-refresh_, enter a time of 60 seconds, and choose _Save_.  Now, choose _Status_ from the menu at the top of the page.

    * Wait and watch for it, and notice that the contents of the green named-server box on the _Status_ page is now auto-refreshed every 60 seconds.  The _Last online_ status should not show a value larger than 3 minutes unless the server is actually down, or whatever interval has been set for the server's update.

    * After ten or fifteen minutes have passed, mouse-click on the green box containing your server's name, and notice the chart now contains at least several data points of access history for your server, at the appropriate time interval.

- See the _PHP Server Monitor_ website and GitHub repository for documentation:

    - http://www.phpservermonitor.org/

    - https://github.com/phpservermon/phpservermon/blob/develop/docs/faq.rst

## Managing _Php-Server-Mon-Sys_
#### The _Php-Server-Mon-Sys_ Home Directory
The _PHP Server Monitor_ application code, along with numerous _Php-Server-Mon-Sys_ configuration files, is stored in a sub-directory tree on the host computer.  The sub-directory where the _Php-Server-Mon-Sys_ project is unzipped and from which its _install-psms.sh_ installation script is executed is its installation "Home" directory.  All sub-directories described below are relative to the _Php-Server-Mon-Sys_ home directory.

Except in situations where you are exploring and doing typical, well understood GNU-utils commands, (ls, cd, etc), _Php-Server-Mon-Sys_ specific management commands, such as the _.sh_ BASH scripts, and "docker-compose...", _should always be executed with the Php-Server-Mon-Sys Home directory as the present working directory, (pwd)_.

#### _Docker_ Commands
The _Php-Server-Mon-Sys_ system is managed using _docker-compose_ commands:

    * docker-compose up -d  # loads and starts, or restarts, _Docker_ containers
    * docker-compose stop   # suspends container Operation
    * docker-compose rm     # destroys loaded containers
    * docker-compose logs   # shows a composite log generated by operating containers

The present working directory must be the _Php-Server-Mon-Sys_ home directory when entering these commands.  Using these commands while the PWD is any other directory will show errors and the command scripts will fail.

See the _Docker_ web site for related documentation:

  - https://docs.docker.com/

#### About The _PHP Server Monitor_ Database
The _PHP Server Monitor_ database "persists" on the host file system, it is not _ephemeral_ as are the _Php-Server-Mon-Sys_ _Docker_ service containers.

The _Php-Server-Mon-Sys_ system, (technically, its _Docker_ service containers), may be started, stopped, restarted, destroyed, and recreated without danger to the _PHP Server Monitor_ database, with one _important caveat_:

  - In order to prevent risk to the _PHP Server Monitor_ database, the _Php-Server-Mon-Sys_ _Docker_ service containers must be created/stopped/destroyed using _Docker_ commands, (_docker-compose stop_, _docker stop_..., etc).

It is possible that database corruption could occur if a container is hard-killed during mid-operation, e.g., if the OS shuts down during a _PHP Server Monitor_ database write.  To prevent database risk, don't shutdown the host OS without first gracefully shutting down the _Php-Server-Mon-Sys_ system, using:

    $ docker-compose stop

After re-booting the OS, restart the _Php-Server-Mon-Sys_ system by making the _Php-Server-Mon-Sys_ home directory the present working directory, then enter the command:

    $ docker-compose up -d

After that command has reloaded the service containers, _PHP Server Monitor_ will continue its job of monitoring services, and collecting and storing data in the  _PHP Server Monitor_ database.

#### _Php-Server-Mon-Sys_ Configuration Changes
##### The _PHP Server Monitor_ Time Zone
The default _PHP Server Monitor_ time zone is UTC.  You may change the time zone by editing the _php.ini_ file, located in the _./src/_ sub-directory.  To do so, search the _php.ini_ file for the term _date.timezone_.  Change the default value, _UTC_, to your time zone.  For valid time zones, see:

  - http://www.php.net/manual/en/timezones.php

After editing the _php.ini_ file, you must restart the _Php-Server-Mon-Sys_ system, for any configuration file changes to take effect:

    $ docker-compose up -d

##### _PHP Server Monitor_ Server History Data Update Intervals: Cron
The interval at which monitored server histories are updated is determined by a PHP script which is executed periodically.  The service which executes the script is _Cron_, which is responsible for executing programs on a schedule.  This task of executing a program periodically is known as a _cron job_.  _Cron_ jobs are specified by creating a file which contains one or more job descriptors.  This file is known as a _crontab_, (_Cron_ table), file.

In _Php-Server-Mon-Sys_, a _cron job_ which updates server histories data is run on-board the _PHP-FPM_ container.  This _cron job_ is started automatically when the _Php-Server-Mon-Sys_ system is started, (_docker-compose up -d_).  The _crontab_ file which contains the job descriptor needed by _Cron_ is named _etc-cron.d-tab-for-phpfpm.txt_, (located in the home _./src/_ sub-directory).

The interval specified in the _crontab_ file determines how frequently the monitored servers are probed.  The default interval is every 3 minutes.  You may change the interval, by editing the _crontab_ file.  You may use any text editor you wish to edit the file, but editing it requires that it be done using _superuser_ (root-level) permission.

One way of editing this _crontab_ file is by using the following command to open the file in an editor named _nano_:

    $ sudo nano ./src/etc-cron.d-tab-for-phpfpm.txt # need sudo or other superuser power

The default job descriptor is:

    */3 * * * * root /usr/bin/php /var/www/public/phpservermon/cron/status.cron.php

Above, the "/3" after the asterisk tells _Cron_ to execute the monitored servers' online history update every 3 minutes.  You may change that number to, e.g., "/5" or "/15", or some other number of minutes, 2 through 59.  If you want the history updated every minute, do not use "/1"; instead, use asterisk (*) by itself, that is, simply delete the "/3".

After editing the _etc-cron.d-tab-for-phpfpm.txt_ file, _Cron_ will automatically detect the _crontab_ file change, and use the newly specified interval.

Aside:  Note that the _crontab_ file _etc-cron.d-tab-for-phpfpm.txt_ requires strict permissions attributes; filemode must be "_mode 600_", and _owner:group_ must be _root:root_.  Do not change these permissions.  If these permissions are changed, the _cron job_ will not execute, therefore the server histories will not be updated.

For more information about _Cron_, see:

  - https://en.wikipedia.org/wiki/Cron

##### NGINX Server Configuration
Though unlikely to be necessary, you may make changes to the NGINX server configuration by editing the _vhost.conf_ file, located in the home _./src/_ sub-directory.  After editing this file, you must restart the _Php-Server-Mon-Sys_ system, as described above, for any changes to take effect.

##### PHP-FPM Server Configuration
Though unlikely to be necessary, you may make changes to the PHP-FPM server configuration by editing the _php-fpm.conf_ and _php.ini_ files, located in the home _./src/_ sub-directory.  After editing these files, you must restart the _Php-Server-Mon-Sys_ system, as described above, for any changes to take effect.

##### Miscellaneous Utility Scripts
Several simple utility BASH scripts are available in the _Php-Server-Mon-Sys_ home sub-directory.  When using them, ensure they are invoked as BASH shell scripts typically are, e.g., _./reset-config-php.sh_, (note the leading "./").  The scripts are safe to use only from within the _Php-Server-Mon-Sys_ home directory; when using them, be sure the present working directory is the _Php-Server-Mon-Sys_ home sub-directory. If they are invoked outside this sub-directory, they will at best fail, or at worst possibly produce unintended side effects.

  - _delete-database.sh_ - Deletes the MySQL database.  Before deleting the database, stop the _Php-Server-Mon-Sys_ system by using:

      $ docker-compose stop

  - _reset-config-php.sh_ - Modifies the _PHP Server Monitor_ configuration file, (_config.php_).  After its modification, when _PHP Server Monitor_ home page is re-visited via the browser, its "new installation" initialization procedure will be invoked.  See the section above, "_PHP Server Monitor_ Initialization".

  - _dbash.sh_ - Executes a BASH shell on a running _Docker_ container. To use it:

      $ docker ps -a  #  shows a list of running containers.  Note a CONTAINER ID...

        result:

            CONTAINER ID        IMAGE        ... etc

            7587be7d4eed        nginx:1.9.2  ... etc

      $ ./dbash.sh  7587be7d4eed # execute a BASH shell on CONTAINER ID

        result:

            root@7587be7d4eed:/#

      Where "_root@7587be7d4eed:/#_" indicates a prompt from within the running _Docker_ container.  The prompt is not running on a true terminal on-boad the container, so program screen output functionality is limited.  However, it is useful enough for exploration inside the operating container, and troubleshooting.

## How To Uninstall _Php-Server-Mon-Sys_
To completely remove the installed _Php-Server-Mon-Sys_:

  - Delete the _Php-Server-Mon-Sys_ home directory.  Before doing so, you should remove the running _Docker_ containers:

      $ docker-compose stop

      $ docker-compose rm

  - After deleting the home directory, remove the unnecessary _Docker_ images from the local _Docker_ image repository:

    - Discover the local _Docker_ images using the command:

      $ docker images

      Their names are _mysql_, _nginx_, and _nmcteam/php56_.  Note their _IMAGE IDs_.

    - One by one, remove the images from the _Docker_ image repository using the command:

      $ docker rmi IMAGE ID.

If you inadvertently uninstall _Php-Server-Mon-Sys_ without first using the _docker-compose rm_ command, you may manually "clean up" the orphaned _Docker_ containers by using other _Docker_ commands.  See the _Docker_ documentation for details; in a nutshell:

  - Discover the orphaned _Docker_ containers by using the command _docker ps -a_, and note the _CONTAINER ID_

  - Remove the _Docker_ containers by using the command:

      $ docker rm -f CONTAINER ID

## Etc
Licensed under Apache 2.0 License.

Copyright &copy; 2015 Rex Addiscentis, raddiscentis@addiscent.com
