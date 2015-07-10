# Php-Server-Mon-Sys
#### Why _Php-Server-Mon-Sys_?
Let's say you manage some websites or other network servers, and you wish to monitor them.  You decide it's time for you install and operate a _Server Monitor_.  There are quite a number of _server monitors_ available, and at this time _PHP Server Monitor_ is your choice.

- http://hpservermonitor.org/

- https://github.com/phpservermon/phpservermon

However, there is a problem, common to many _server monitors_.  The problem is, installing _PHP Server Monitor_ can be very complicated and time consuming.  _Php-Server-Mon-Sys_ solves this problem.  _Php-Server-Mon-Sys_ makes installation of _PHP Server Monitor_ much faster and simpler.

#### What is complicated about _PHP Server Monitor_ installation?
_PHP Server Monitor_ installation itself is not terribly complicated.  But, _PHP Server Monitor_ is dependent on several other services for its operation, including an HTTP server, a MySQL server, and a PHP-FPM server.  In order to run _PHP Server Monitor_, those services must be installed on the _PHP Server Monitor's_ host system.  However, on many computers, those services are not already installed.  Unless installation is performed by a qualified system administrator, installing those services is error-prone and time consuming.

#### _Php-Server-Mon-Sys_ Is A _Turnkey_ System
_Php-Server-Mon-Sys_ significantly reduces the complexity of _PHP Server Monitor_ installation, on host computers which do not already have the required support services installed.  In addition to installing _PHP Server Monitor_, _Php-Server-Mon-Sys_ also installs NGINX, MySQL, and PHP-FPM, as "private" services which are available only to _PHP Server Monitor_.  These services are not installed directly into the host operating system per usual.  The services are deployed using _Docker_ containers, which means the new services may be very easily installed and un-installed along with the _PHP Server Monitor_ application software.

By using _Docker_ containers and a straightforward isolated sub-directory tree implementation, the services and application do not become "entangled" in the native operating system, nor yet another cause of conflict with other application software installed on the host.  If you no longer need the _PHP Server Monitor_ software in your system, you may very easily remove it.  When it is removed, _PHP Server Monitor's_ supporting services are removed as well.  There is no need to individually remove each of the other services no longer needed.

Keep in mind that the NGINX, MySQL, and PHP-FPM services which are installed by _Php-Server-Mon-Sys_ are available only to _PHP Server Monitor_; they are not intended to be available to other application software on the host system.  The services are _ephemeral_; they come and go along with the installation, operation, and un-installation of _Php-Server-Mon-Sys_.

The version of _PHP Server Monitor_ incorporated into this release of _Php-Server-Mon-Sys_ is _PHP Server Monitor v3.1.1_.

This version of _Php-Server-Mon-Sys_, _v0.0.2_ has been tested only on a host using _Ubuntu 14.04_.  _Php-Server-Mon-Sys_ has not yet been tested on _OS X_ nor _Windows_.  Theoretically, _Php-Server-Mon-Sys_ should work on any host which fully supports _Docker_ tools, but that has not been proven firsthand.

### System Requirements
Installation and operation of _Php-Server-Mon-Sys_ requires:

  - 500MB available memory
  - 1.25GB available storage
  - Internet connection/service
  - _Docker_ Engine 1.7, pre-installed
  - _Docker_ Compose 1.3.1, pre-installed

### _Php-Server-Mon-Sys_ Installation Instructions
1. Download this project ZIP file into a convenient storage location. Unzip, (keep dir structure).

  - _http://github.com/addiscent/Php-Server-Mon-Sys_

2. $ sudo ./run-me-first.sh  # sudo on debian, or superuser permissions on whatever

3. $ docker-compose up -d  # wait one minute for mysql to finish initializing database

### _PHP Server Monitor_ Initialization
- Use a web browser, visit:

    * http://localhost:8080/phpservermon/

- Read and follow the directions on the first page, then choose _LET'S GO_.

- For each field, enter these values:

    * _Database host_ : _mysqlpsm_

    * _Database name_ : _phpservermon_

    * _Database user_ : _phpservermon_

    * _Database password_ : _phpservermon_

    * _Table prefix_ : psm_

    * Choose _SAVE CONFIGURATION_

- Set your user, password, and email to whatever you wish.

    * Choose _INSTALL_

- Choose _GO TO YOUR MONITOR_

### Quick-start Guide To _PHP Server Monitor_ Operation
- Enter your user credentials and choose _LOGIN_.  The home page shows _STATUS_.

- Enter a server to monitor:

    * Choose _Servers_ from the top menu. The next page shows _Servers_ page.

    * Choose the green _ADD NEW_ button.  Enter the appropriate data into the fields, then choos _SAVE_.    * Choose _Status_ from the top menu. Click on the box containing your server's name for a chart of response time history.  The server's access history chart is updated with a new data point every three minutes.

    * Choose _Config_ from the top menu.  Enter a time of 60 seconds into the _Auto-refresh_ field, and choose _Save_.  Choose _Status_ from the top menu.  The _Status_ page is self-refreshed every 60 seconds.

    * See the _PHP Server Monitor_ website and GitHub repository for documentation:

        - http://www.phpservermonitor.org/

        - https://github.com/phpservermon/phpservermon/blob/develop/docs/faq.rst

## Managing _Php-Server-Mon-Sys_
The _PHP Server Monitor_ application code, along with numerous _Php-Server-Mon-Sys_ configuration files, is stored in a sub-directory tree on the host computer.  The sub-directory where the _Php-Server-Mon-Sys_ project is unzipped and from which its _run-me-first.sh_ installation script is executed is its installation "home" directory.  All sub-directories described below are relative to the _Php-Server-Mon-Sys_ home directory.

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

It is possible that database corruption could occur if a container is hard-killed during mid-operation, e.g., if the OS shuts down during a _PHP Server Monitor_ database write.  To prevent database risk, don't shutdown the host OS without first gracefully shutting down the _Php-Server-Mon-Sys_ system, using _docker-compose stop_.  After re-booting the OS, restart the _Php-Server-Mon-Sys_ system by making the _Php-Server-Mon-Sys_ home directory the present working directory, then enter the command _docker-compose up -d_.  After that command has reloaded the service containers, _PHP Server Monitor_ will continue its job of monitoring services, and collecting and storing data in the  _PHP Server Monitor_ database.

#### _Php-Server-Mon-Sys_ Configuration Changes
##### The _PHP Server Monitor_ Time Zone
The default _PHP Server Monitor_ time zone is UTC.  You may change the time zone by editing the _php.ini_ file, located in the _./src/_ sub-directory.  To do so, search the _php.ini_ file for the term _date.timezone_.  Change the default value, _UTC_, to your time zone.  For valid time zones, see:

  - http://www.php.net/manual/en/timezones.php

After editing the _php.ini_ file, you must restart the _Php-Server-Mon-Sys_ system, for any configuration file changes to take effect:

    $ docker-compose up -d

##### _PHP Server Monitor_ Server Data Update Intervals: Cron
A cron job is started automatically when the system is started, (_docker-compose up -d_).  The interval of the cron job determines how often the monitored servers are probed.  The default interval is every 3 minutes.  You may change the interval by changing the crontab file, _etc-cron.d-tab-for-phpfpm.txt_, located in the home _./src/_ sub-directory.  This cron job is run on the PHP-FPM container, but is exposed on the host file system so it may be conveniently edited.  Note that this file requires strict permissions, e.g., mode 600, and owner:group must be root:root.  Otherwise, the cron job will not run.

After editing the _php.ini_ file, you must restart the _Php-Server-Mon-Sys_ system, as described above, for any changes to take effect.

For more information on Cron, see:

  - https://en.wikipedia.org/wiki/Cron

##### NGINX Server Configuration
Though unlikely to be necessary, you may make changes to the NGINX server configuration by editing the _vhost.conf_ file, located in the home _./src/_ sub-directory.  After editing this file, you must restart the _Php-Server-Mon-Sys_ system, as described above, for any changes to take effect.

##### PHP-FPM Server Configuration
Though unlikely to be necessary, you may make changes to the PHP-FPM server configuration by editing the _php-fpm.conf_ and _php.ini_ files, located in the home _./src/_ sub-directory.  After editing these files, you must restart the _Php-Server-Mon-Sys_ system, as described above, for any changes to take effect.

##### Miscellaneous Utility Scripts
Several simple utility BASH scripts are available in the _Php-Server-Mon-Sys_ home sub-directory.  When using them, ensure they are invoked as BASH shell scripts typically are, e.g., _./reset-config-php.sh_, (note the leading "./").  The scripts are safe to use only from within the _Php-Server-Mon-Sys_ home directory; when using them, be sure the present working directory is the _Php-Server-Mon-Sys_ home sub-directory. If they are invoked outside this sub-directory, they will at best fail, or at worst possibly produce unintended side effects.

  - _delete-database.sh_ - Deletes the MySQL database.  Before deleting the database, stop the _Php-Server-Mon-Sys_ system first by using _docker-compose stop_.

  - _reset-config-php.sh_ - Modifies the _PHP Server Monitor_ configuration file, (_config.php_).  It is modified in a manner which will cause the installation procedure to run again the next time the _PHP Server Monitor_ home page is visited in the browser.

  - _dbash.sh_ - Executes a BASH shell on a running _Docker_ container. To use it:

      $ _Docker_ ps -a  #  shows a list of running containers.  Choose an ID...

        CONTAINER ID        IMAGE        ... etc

        7587be7d4eed        nginx:1.9.2  ... etc

      $ ./dbash.sh  7587be7d4eed

        root@7587be7d4eed:/#

        Where "_root@7587be7d4eed:/#_" indicates a prompt from within the running _Docker_ container.  The prompt is not on a terminal, so screen functionality is limited, but usually useful enough for troubleshooting, by exploration of the operating container.

## Uninstallation Of _Php-Server-Mon-Sys_
To completely remove the installed _Php-Server-Mon-Sys_:

  - Delete the _Php-Server-Mon-Sys_ home directory.  Before doing so, you should remove the running _Docker_ containers:

      $ docker-compose stop

      $ docker-compose rm

  - After deleting the home directory, remove the unnecessary _Docker_ images from the local _Docker_ image repository:

    - Discover the _Docker_ images using the command:

      $ _Docker_ images

      Their names are _mysql_, _nginx_, and _nmcteam/php56_.  Note their _IMAGE IDs_.

    - One by one, remove the images from the _Docker_ image repository using the command:

      $ _Docker_ rmi IMAGE ID.

If you inadvertently uninstall _Php-Server-Mon-Sys_ without first using the _docker-compose rm_ command, you may manually "clean up" the orphaned _Docker_ containers by using other _Docker_ commands.  See the _Docker_ documentation for details; in a nutshell:

  - Discover the orphaned _Docker_ containers by using the command _docker ps -a_, and note the _CONTAINER ID_

  - Remove the _Docker_ containers by using the command _docker rm -f CONTAINER ID_

## Etc
Licensed under Apache 2.0 License.

Copyright &copy; 2015 Rex Addiscentis, raddiscentis@addiscent.com
