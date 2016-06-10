# Php-Server-Mon-Sys
#### Why _Php-Server-Mon-Sys_?
Let's say you manage some websites or other network servers, and you wish to monitor them.  You decide it's time to install and operate a _Server Monitor_ to help with that task.  There are quite a number of _server monitors_ available from which to choose.  At this time you choose a basic, easy-to-use server monitor named _PHP Server Monitor_:

  - http://phpservermonitor.org/

  - http://www.phpservermonitor.org/support/

  - https://github.com/phpservermon/phpservermon

_PHP Server Monitor_ may be installed on a shared host or a VPS.  If your shared host or VPS is already configured to serve websites, all of the services _PHP Server Monitor_ requires are often already installed.  If the services it needs are already installed, you do not need to use _Php-Server-Mon-Sys_; the default method of installing _PHP Server Monitor_ is probably required on a shared host, and is probably preferred on a VPS.

However, if your host does not already have the required services installed, you now have a problem.  The problem is, installation of the required services may be complicated and time consuming.

_Php-Server-Mon-Sys_ solves this problem.  In many cases, _Php-Server-Mon-Sys_ makes installation of _PHP Server Monitor_ much faster and simpler on hosts which do not already have the required services installed.

#### _Php-Server-Mon-Sys_ Is A _Turnkey_ System
In addition to installing _PHP Server Monitor_, _Php-Server-Mon-Sys_ installs the required services.  _Php-Server-Mon-Sys_ includes NGINX, MySQL, and PHP-FPM.  These are "private" services which are available only to _PHP Server Monitor_.  These services are not installed directly into the host operating system per usual.  These services are deployed using _Docker_ containers.  Using Docker containers means these services may be very easily and cleanly installed and un-installed along with the _PHP Server Monitor_ application software.  Backing up and restoring are also quick and uncomplicated.

When you no longer need the _PHP Server Monitor_ software in your system, you may very easily remove it.  When it is removed, _PHP Server Monitor's_ supporting services are removed as well.  There is no need to individually remove each of the other services no longer needed.

Keep in mind that the NGINX, MySQL, and PHP-FPM services which are installed by _Php-Server-Mon-Sys_ are available only to _PHP Server Monitor_; they are not intended to be available to other application software on the host system.  The services are _ephemeral_; they come and go along with the installation, operation, and un-installation of _Php-Server-Mon-Sys_.

The _Php-Server-Mon-Sys_ project is _Open Source_, and its public repository is located at:

  - https://github.com/addiscent/php-server-mon-sys

The version of _PHP Server Monitor_ incorporated into this release of _Php-Server-Mon-Sys_ is _PHP Server Monitor v3.1.1_.

This version of _Php-Server-Mon-Sys_ has been tested only on a host using _Ubuntu 14.04_.  _Php-Server-Mon-Sys_ has not yet been tested on _OS X_ nor _Windows_.  Theoretically, _Php-Server-Mon-Sys_ should work on any host which fully supports _Docker_ tools, but that has not yet been tested.

### System Requirements
Installation and operation of _Php-Server-Mon-Sys_ requires:

  - Superuser access to a private host or VPS
  - 300MB available memory
  - 1.1GB available storage, (plus server history data accumulated in database)
  - Internet connection/service
  - Docker Engine 1.11, pre-installed
  - Docker Compose 1.7, pre-installed
  - Curl 7.35.0, pre-installed, (alternate equivalent may be substituted)
  - UnZip 6.00, pre-installed, (alternate equivalent may be substituted)

### _Php-Server-Mon-Sys_ Installation Instructions
- The following commands download the _Php-Server-Mon-Sys_ release ZIP file, and unzip the contents into a newly created directory.  Before entering the following commands, change the present working directory to where you want the _Php-Server-Mon-Sys_ Home directory to be created.  Then, enter the following commands:

      $ curl -L -O https://github.com/addiscent/php-server-mon-sys/archive/master.zip

      $ unzip master.zip  # create a new directory containing Php-Server-Mon-Sys

    The name of the new directory is _php-server-mon-sys-master_.  The new directory is the _Home_ directory for _Php-Server-Mon-Sys_.  If you wish to rename the _Php-Server-Mon-Sys_ Home directory, you may do so at any time.  You may delete the _master.zip_ file now, or later.

- The following commands build Docker containers, and start _Php-Server-Mon-Sys_ operation:

      $ cd php-server-mon-sys-master  # or to whatever you rename the directory

      $ ./build-psms.sh  # execute this BASH script only in the php-server-mon-sys-master directory

    IMPORTANT: You must wait a bit, (up to two minutes on very slow hosts), for MySQL to finish initializing its database before continuing with _PHP Server Monitor_ Initialization instructions below.  Otherwise, errors will be displayed during the _PHP Server Monitor_ Initialization process.  At this point, if an error is shown stating, "Unable to connect to MySQL. Please check your information", it is temporary.  Wait a few minutes, and retry _PHP Server Monitor_ Initialization.

Initially, you are evaluating the software.  After you become familiar with it, you will probably decide to discard the first database created during _PHP Server Monitor_ Initialization.  However, before creating the database you plan to use "in production", read the three sections below titled:

  - _Transitioning From Evaluation To Production_

  - _PHP Server Monitor_ _Database Passwords_

  - _PHP Server Monitor_ _Time Zone_

### _PHP Server Monitor_ Initialization
- After completing the Installation instructions above, use a web browser to visit:

    * http://localhost:28684

- Read and follow the directions on the first page, then choose _LET'S GO_.

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

- See the _PHP Server Monitor_ website and GitHub repository for full official documentation:

  - http://www.phpservermonitor.org/

  - http://www.phpservermonitor.org/support/

  - https://github.com/phpservermon/phpservermon/blob/develop/docs/faq.rst

## Managing _Php-Server-Mon-Sys_
#### _Php-Server-Mon-Sys_ Home Directory
_Php-Server-Mon-Sys_-specific management commands, such as the _.sh_ BASH scripts, and "docker-compose...", _should always be executed with the Php-Server-Mon-Sys Home directory as the present working directory, (pwd)_.

#### _Docker_ Commands
The _Php-Server-Mon-Sys_ system is managed using _docker-compose_ commands:

    * docker-compose up -d  # loads and starts, or restarts, _Docker_ containers
    * docker-compose stop   # suspends container Operation
    * docker-compose logs   # shows a composite log generated by operating containers
    * docker-compose rm     # destroys loaded containers.  "stop" them first.

The present working directory must be the _Php-Server-Mon-Sys_ Home directory when entering these commands.  Using these commands while the PWD is any other directory will show errors and the command scripts will fail.

Note that _docker-compose rm_ is seldom used, typically only when completely uninstalling _Php-Server-Mon-Sys_.

See the _Docker_ web site for related documentation:

  https://docs.docker.com/


#### Starting _Php-Server-Mon-Sys_ After A Reboot
The _Php-Server-Mon-Sys_ installation process does not add _Php-Server-Mon-Sys_ to the init, (startup system), of the host machine.  This means that _Php-Server-Mon-Sys_ must be started manually each time the host is rebooted.  You may choose to add _Php-Server-Mon-Sys_ startup commands to the init of the host system, but how to do that is dependent on the distribution of the OS on which it is installed, and is beyond the scope of this document.
 
After re-booting the host OS, restart the _Php-Server-Mon-Sys_ system by making the _Php-Server-Mon-Sys_ home directory the present working directory, then enter the command:

        $ docker-compose up -d

After that command has reloaded the service containers, _PHP Server Monitor_ will continue its job of monitoring services, and collecting and storing server history data into the _PHP Server Monitor_ database.


#### Reducing Risk To The _PHP Server Monitor_ Database
The _PHP Server Monitor_ database "persists" on the host file system.  The _Php-Server-Mon-Sys_ system, (technically, its _Docker_ service containers), may be started, stopped, restarted, destroyed, and recreated without danger to the contents or integrity of the _PHP Server Monitor_ database.  However, as with any other software executing on the host, there is one _important caveat_:

  - In order to prevent risk to the _PHP Server Monitor_ database, the _Php-Server-Mon-Sys_ _Docker_ service containers must be created/stopped/destroyed using _Docker_ commands, (_docker-compose up_, _docker-compose stop_, etc).  Do not "cut power" or do a "hardware reset" of the host OS without first gracefully shutting down the _Php-Server-Mon-Sys_ system, using the command:

        $ docker-compose stop

This is necessary only if the host must be "reset", (not allowed to do an orderly shutdown).  It is not necessary to manually shutdown _Php-Server-Mon-Sys_ if the host does an orderly shutdown, (i.e., _shutdown -r now_), because an OS doing an orderly shutdown will send SIG signals to the Docker containers notifying them they should terminate, and should give them time to end gracefully.  The service containers will ensure data integrity, as long as they are allowed to finish their graceful shutdown before the system OS exits.

After re-booting the host OS, follow the procedure described above, in the section titled _Starting Php-Server-Mon-Sys After A Reboot_.

#### Transitioning From Evaluation To Production
When you have finished learning what _Php-Server-Mon-Sys_ is all about, it is likely you will wish to discard the data accumulated initially, during evaluation.  It may be advantageous to follow the procedure described in this section while also performing the procedures described in the other sections below, _PHP Server Monitor_ _Database Passwords_ and _PHP Server Monitor_ _Time Zone_.  You may wish to read those sections before following the procedure described here.

Deleting the _PHP Server Monitor_ database causes _Php-Server-Mon-Sys_ to automatically create a new one.  Therefore, the easiest and fastest way to create an empty database, (discard the old data), is to simply delete the existing _PHP Server Monitor_ database.  Keep in mind that deleting the database deletes all data previously created during _PHP Server Monitor_ Initialization.  In addition to all _PHP Server Monitor_ server history data, the list of _PHP Server Monitor_ servers and any _PHP Server Monitor_ user and admin accounts are deleted.

To delete the existing _PHP Server Monitor_ database, enter the following commands:

      $ sudo ./delete-database.sh  # sudo or other superuser power required

      $ docker-compose up -d # delete-database.sh stops Php-Server-Mon-Sys, so it must be restarted

After the database is deleted, a new database will be automatically created when _Php-Server-Mon-Sys_ is re-started.  Depending on the speed of your host, it could take up to two minutes to finish creating the new database.  Then, use a web browser to visit your _PHP Server Monitor_ page per usual, (default, localhost:28684).  If you see an error message which says "can't connect to database", wait a little longer and retry.  Follow the prompts and begin using as normal.

##### _PHP Server Monitor_ Database Passwords
When _Php-Server-Mon-Sys_ is installed, it automatically creates the database.  The database passwords are set to defaults at that time.  If you wish to tighten up the security of your database, you may change the database passwords.

The database passwords cannot be changed by _Php-Server-Mon-Sys_ after a database has been created; the passwords must be decided upon prior to creation of the database.  A good time to do this is after you have finished evaluation of _Php-Server-Mon-Sys_ and you are subsequently ready to "go into production".  At that time, you are most likely to decide you wish to abandon the first database and create a new one.

When you are ready to create a new database using new passwords, follow these steps:

  - Set new passwords into the appropriate configuration files by entering the following command:

      $ ./set-passwords.sh _root_password_ _user_password_ # replace these passwords with your own

  - Re-build the PHP-FPM Docker container using the following command:

      $ ./build-php-fpm.sh

  - Delete the database.  The following commands stop _Php-Server-Mon-Sys_, delete the files containing the database, and then re-start _Php-Server-Mon-Sys_:

      $ sudo ./delete-database.sh

      $ docker-compose rm   # obsolete PHP-FMP container must be unloaded

      $ docker-compose up -d  # re-start Php-Server-Mon-Sys. Loads re-built PHP-FPM container

It is necessary to wait for the database to finish initialization, (up to two minutes on a very slow host).

##### _PHP Server Monitor_ Time Zone
The default _PHP Server Monitor_ time zone is _UTC_.  You may change the time zone by editing the _php.ini_ file, located in the _./php-fpm/_ sub-directory.

Note that the _PHP Server Monitor_ _Time Zone_ must only be changed _BEFORE_ creating the _PHP Server Monitor_ database.  The _PHP Server Monitor_ database is created during the process described above, in the section titled, _PHP Server Monitor_ _Initialization_.  If the _PHP Server Monitor_ _Time Zone_ is set after _PHP Server Monitor_ _Initialization_, the timestamps on the server history data collected into the database will be out of sync with the displayed charts, rendering the collected data useless for charting in _PHP Server Monitor_.

To change the _PHP Server Monitor_ _Time Zone_, search the _./php-fpm/php.ini_ file for the term _date.timezone_.  Change the default value, _UTC_, to your time zone, e.g., _America/Los_Angeles_.  For valid time zone codes, see:

  http://www.php.net/manual/en/timezones.php

##### _PHP Server Monitor_ Application Service Port number
The default application, (HTTP), service port number is _28684_.  You may change this port number by editing the _docker-compose.yml_ file.  Find the section which appears as follows:

    ports:
      - "28684:80"

Change the port number _28684_ to any valid port number which does not conflict with other ports in use on the host.  After editing this file, for any changes to take effect, _Php-Server-Mon-Sys_ must be restarted, using the command:

      $ docker-compose up -d

##### _PHP Server Monitor_ Application Remote Access And Security Considerations
_PHP Server Monitor_ admin access is not limited to "localhost-only".  Because the _PHP Server Monitor_ service port serves a web page using HTTP, it may be accessed remotely, over a private network or the Internet.  If you do so, there are several important security implications to keep in mind.

To access _Php-Server-Mon-Sys_ over a private network or the Internet, you may need to unblock the application service port, (default 28684), on your firewall.  To find out if a firewall is enabled, (on Ubuntu distributions as an example), enter the following command :

    $ sudo ufw status verbose
    
The result informs you that the firewall is either not enabled, or it is enabled.  If the firewall is not enabled, the _PHP Server Monitor Application Service Port_ is not blocked by the host firewall.  If this is the case, your host is known an "open server", which means any computer on the network is allowed to _try_ to connect to it.

If the firewall is enabled, the command above shows a list of allow/deny rules for access to the host from the network.  In our case, a rule must exist which allows access to the _PHP Server Monitor Application Service Port_ from the desired source, such as the IP address or address range on the local network or the Internet.  If an appropriate "allow" rule doesn't exist, create it.  Ensure that when you create the "allow" rule, you allow access to only the _PHP Server Monitor Application Service Port_, and also carefully consider the source IP address(es) you are allowing, (trusted?).  To "run a tight ship", you may allow access by only a single trusted IP address, no others.

The most important security consideration when allowing remote access is the potential for a "man-in-the-middle-attack" on your _PHP Server Monitor_ login credentials, most importantly your password.  _Php-Server-Mon-Sys_ does not use SSL/TLS, (HTTPS), encryption on the connection between the user's browser and the _PHP Server Monitor_ server.  This means when you log into _PHP Server Monitor_, the login credentials you enter, including your password, are sent in "clear-text" form, not encrypted.

It is always the case that any computer on any network over which any data traverses could be used to "snoop" on the TCP/IP packets transferred on that network.  If data, in this case the password, is encrypted, there is no danger that a "snooper" can re-use it later to log into your _PHP Server Monitor_.  However, to re-emphasize an important point, _Php-Server-Mon-Sys_ does not use SSL/TLS, (HTTPS), encrypted communication; your login credentials are sent in clear-text form.  This is not a security problem when doing "localhost" access, and typically is not a security problem on trusted/secure (private) networks.  But, if you use an untrusted network, such as the Internet, for access to _PHP Server Monitor_, there is a possibility that _PHP Server Monitor_ login credentials could be recorded by snoopers. (See https://en.wikipedia.org/wiki/Wireshark)

_Php-Server-Mon-Sys_ is Open Source Software, so you may add SSL/TLS, (HTTPS), encryption to the NGINX web server configuration, if you wish.  It is not trivial to do so, but the knowledge gained by doing it could be valuable to you if you are a technical professional.

Keep in mind that if the login credentials captured by a snooper allow access to a _PHP Server Monitor_ admin account, they also allow access to the _PHP Server Monitor_ database, but is the extent of the risk.  This does not mean someone with _PHP Server Monitor_ admin priviliges has full access to the host computer, only the _PHP Server Monitor_ database server.  Also, because _Php-Server-Mon-Sys_ is constructed using Docker containers, there is another layer of isolation from malicious activity by intruders.  A black-hat hacker may gain admin-level access to your host computer, acquired by other means, perhaps due to other lax security practices, but the risk is exceedingly small from a properly configured _Php-Server-Mon-Sys_ installation.

As it stands now, you must decide for yourself what is the risk and downside to which you are exposing yourself by logging into _Php-Server-Mon-Sys_ over any untrusted network, especially the Internet.  The consequences for personal and non-mission critical use are probably not dire, amounting to someone _possibly_ vandalizing the server history data in the database, which could be recovered from a backup.  On the other hand, if, for example, I sold monitoring services to customers, I would not allow logging into _Php-Server-Mon-Sys_ over the Internet, only "localhost".

_Php-Server-Mon-Sys_

##### _PHP Server Monitor_ Server History Data Update Intervals: Cron
The interval at which monitored server histories are updated is determined by a PHP script which is executed periodically.  The service which executes the script is _Cron_, an ubiquitous Linux service which is responsible for executing programs on a schedule.  This task of executing a program periodically is known as a _cron job_.  _Cron_ jobs are specified by creating a file which contains one or more job descriptors.  This type of file is known as a _crontab_, (_Cron_ table), file.

In _Php-Server-Mon-Sys_, a _cron job_ which updates server histories data is run inside the _PHP-FPM_ container.  This _cron job_ is started automatically when the _Php-Server-Mon-Sys_ system is started, (using _docker-compose up -d_).  The _crontab_ file which contains the job descriptor needed by _Cron_ is named _etc-cron.d-tab-for-phpfpm.txt_, (located in the home _./php-fpm/_ sub-directory).

The interval specified in the _crontab_ file determines how frequently the monitored servers are probed.  The default interval is every 3 minutes.  You may change the interval, by editing the _crontab_ file.  One way of editing the _crontab_ file is by using the following command to open the file in an editor named _nano_:

      $ nano ./php-fpm/etc-cron.d-tab-for-phpfpm.txt

The default job descriptor is:

    */3 * * * * root /usr/bin/php /var/www/public/cron/status.cron.php

Above, the "/3" after the asterisk tells _Cron_ to execute, (every 3 minutes), the PHP code which monitors servers.  You may change that number to, e.g., "/5" or "/15", or some other number of minutes, 2 through 59.  If you want the history updated every minute, do not use "/1"; instead, use asterisk (*) by itself, that is, simply delete the "/3".

After editing the _etc-cron.d-tab-for-phpfpm.txt_ file, the PHP-FPM Docker container image must be rebuilt, and then _Php-Server-Mon-Sys_ restarted.  Do so using the following commands:

      $ ./build-php-fpm.sh   # execute this from the PSMS Home directory

      $ docker-compose up -d  # restart the Php-Server-Mon-Sys system

For more information about _Cron_, see:

    https://en.wikipedia.org/wiki/Cron

##### Managing The _PHP Server Monitor_ Database
The _PHP Server Monitor_ database is a _MySQL_ database.  As such, it can be managed by using the appropriate _MySQL-compatible_ software tools, such as a _mysql client_ program, or _phpMyAdmin_.  Though the _PHP Server Monitor_ _MySQL_ _Docker_ container is local to the host, connections to the database server are made as if it is remote.  Connections to remote _MySQL_ servers are established using the _MySQL_ server _Docker container's_ IP address and a port number.  The default port address is _3306_.  To discover the IP address of the server, use the following commands:

  $ docker ps -a | grep mysql

    result is similar to:

      203942ceb32d    mysql:5.7.7    "/entrypoint.sh mysql"   ...   phpservermonsysmaster_db_1

  Note the CONTAINER ID.  To discover the IP address of that container, use the following command:

  $ docker inspect -f "{{ .NetworkSettings.IPAddress }}" 203942ceb32d # use your CONTAINER ID

    result is similar to:

      172.17.2.109

See instructions below for example client connections, using _MySQL Client Program_ and _phpMyAdmin_.

##### Using A _MySQL_ Client Program With _PHP Server Monitor_ Database
The following instructions assume you are already familiar with _MySQL_ commands and operation procedures.

The command below pulls and temporarily loads a _mysql_ Docker container for use as a _MySQL client_.  After exiting the _mysql> prompt_, the temporary _MySQL client_ container is automatically discarded.

Enter the following command, (substitute the _MySQL_ server _Docker_ container IP address which you discovered above as the IP address value):

      $ docker run -it --rm mysql sh -c 'exec mysql -h"172.17.2.109" -P"3306" -uroot -p"mysecretpassword"'

      result is similar to:

                .
                .
        Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
        mysql>

The text _"mysql>"_ is a command prompt, waiting for you to enter MySQL commands:

      mysql> show databases;

        result:

          +--------------------+
          | Database           |
          +--------------------+
          | information_schema |
          | mysql              |
          | performance_schema |
          | phpservermon       |
          | sys                |
          +--------------------+
          5 rows in set (0.05 sec)

      mysql> use phpservermon;

        result:

          Database changed

      mysql> show tables;

        result:

          +------------------------+
          | Tables_in_phpservermon |
          +------------------------+
          | psm_config             |
          | psm_log                |
          | psm_servers            |
          | psm_servers_history    |
          | psm_servers_uptime     |
          | psm_users              |
          | psm_users_preferences  |
          | psm_users_servers      |
          +------------------------+
          8 rows in set (0.00 sec)

For more information about using the MySQL command line program, see:

    http://dev.mysql.com/doc/refman/5.6/en/mysql.html

When ready to exit the mysql client, enter:

    mysql> exit;

##### Using _phpMyAdmin_ With _PHP Server Monitor_ Database
The following instructions assume _phpMyAdmin_ is already installed on your host, and you are already familiar with _phpMyAdmin_ configuration and operation procedures.

To connect _phpMyAdmin_ to the _PHP Server Monitor_ database server, the _phpMyAdmin_ _config.inc.php_ file must be revised, as follows.

Open the _phpMyAdmin_ _config.inc.php_ file in a text editor.  Find the list of servers, which have entries similar to that given below, and add the following server code for the _Php-Server-Mon-Sys_ _MySQL_ server.  Before inserting the code fragment given below, change the IP address from _172.17.2.109_ to the address of the _MySQL_ server _Docker_ container discovered using the method described above.  If you have previously changed your user or password for this database, also change those values in the code fragment below:

    $i++;

    $cfg['Servers'][$i]['verbose'] = 'Php-Server-Mon-Sys';
    $cfg['Servers'][$i]['host'] = '172.17.2.109';
    $cfg['Servers'][$i]['port'] = '3306';
    $cfg['Servers'][$i]['socket'] = '';
    $cfg['Servers'][$i]['connect_type'] = 'tcp';
    $cfg['Servers'][$i]['auth_type'] = 'config';
    $cfg['Servers'][$i]['user'] = 'phpservermon';
    $cfg['Servers'][$i]['password'] = 'phpservermon';

IMPORTANT:  Unfortunately, it is not uncommon to discover that more than one _phpMyAdmin_ _config.inc.php_ file already exists on a host, (placed there by the _phpMyAdmin_ installation process).  If you edit one and it seems to have no affect, you may inadvertently be editing a copy of the file which is not the specific file used by _phpMyAdmin_.  To search for the correct instance, you may discover where copies are located using the following command:

      $ sudo find / -maxdepth 4 -name config.inc.php

        result, similar to this:

          /usr/share/phpmyadmin/config.inc.php
          /var/lib/phpmyadmin/config.inc.php
          /etc/phpmyadmin/config.inc.php

For more information about editing the _phpMyAdmin_ _config.inc.php_ file, see:

    http://docs.phpmyadmin.net/en/latest/config.html

##### NGINX Server Configuration
Though unlikely to be necessary, you may make changes to the NGINX server configuration by editing the _vhost.conf_ file, located in the home _./nginx/_ sub-directory.  After editing this file, for any changes to take effect, _Php-Server-Mon-Sys_ must be restarted, using the command:

      $ docker-compose up -d

##### PHP-FPM Server Configuration
Though unlikely to be necessary, you may make changes to the PHP-FPM server configuration by editing the _php-fpm.conf_ and _php.ini_ files, located in the _./php-fpm/_ sub-directory.  After editing these files, you must restart the _Php-Server-Mon-Sys_ system as described above for any changes to take effect.

##### Miscellaneous Utility Scripts
Several simple utility BASH scripts are available in the _Php-Server-Mon-Sys_ home sub-directory.  When using them, ensure they are invoked as BASH shell scripts typically are, e.g., _./build-psms.sh_, (note the leading "./").  The scripts are safe to use only from within the _Php-Server-Mon-Sys_ Home directory; when using them, be sure the present working directory is the _Php-Server-Mon-Sys_ home sub-directory. If they are invoked outside this sub-directory, they will at best fail, or at worst possibly produce undesirable side effects.

  - _dbash.sh_ - Executes a BASH shell on a running _Docker_ container. To use it:

      $ docker ps -a  #  shows a list of running containers.  Note a CONTAINER ID...

        result:

            CONTAINER ID        IMAGE        ... etc

            7587be7d4eed        nginx:1.9.2  ... etc

      $ ./dbash.sh  7587be7d4eed # execute a BASH shell on CONTAINER ID

        result:

            root@7587be7d4eed:/#

      Where "_root@7587be7d4eed:/#_" indicates a prompt from within the running _Docker_ container.  The prompt is not running on a true terminal on-boad the container, so program screen output functionality is limited.  However, it is useful enough for exploration inside the operating container, and troubleshooting if necessary.  In the event you need to use, for example, a text viewer or editor, such as _less_ or _nano_, set the TERM environment variable using the following command, (on the container, using the container's executing shell, not on the host):

          $ export TERM=xterm

  - _build-php-fpm.sh_ - very seldom used. Prevents having to remember arcanum

## Backing Up _Php-Server-Mon-Sys_
The entire _Php-Server-Mon-Sys_ Home directory, including the MySQL database, may be backed-up into a single _.tar.gz_ file.  To do so, use the provided BASH script command:

      $ sudo ./backup-psms.sh  # sudo or equivalent superpower is required

The backup script temporarily stops the operation of _Php-Server-Mon-Sys_, but operation is re-started automatically at the end of the backup operation.  If a re-start is not desired, stop it manually using:

      $ docker-compose stop

The backup file has a name similar to the following.  The date and time of backup are added to filename during backup:

    php-server-mon-sys.2015.0716.2256.tar.gz

## Restoring _Php-Server-Mon-Sys_ From A Backup file
To restore _Php-Server-Mon-Sys_ from a back-up file created as described above, perform the following procedure:

- Create a directory to be _Php-Server-Mon-Sys_ Home.  The name may be any you choose.  As an example:

      $ mkdir php-server-mon-sys  # same as it ever was

      $ cd php-server-mon-sys

- Place the backup _.tar.gz_ file here in the present working directory, (which is the new _Php-Server-Mon-Sys_ Home).  Use the following command to restore _Php-Server-Mon-Sys_, e.g.:

      $ sudo tar -zxvf ./php-server-mon-sys.2015.0716.2256.tar.gz

  When _tar_ execution is complete, the _Php-Server-Mon-Sys_ Home directory contents is similar to:

      drwxrwx--- 3 user  group    4.0K Jul 16 13:26 mysql
      drwxrwx--- 2 user  group    4.0K Jul 16 13:21 nginx
                            .
                            .
      -rw-rw-r-- 1 user  group     12K Jul  4 01:24 LICENSE
      -rw-rw-r-- 1 user  group     19K Jul 16 22:32 README.md

- To start _Php-Server-Mon-Sys_ operation, enter the following commands:

      $ ./build-psms.sh   # build Docker container images

      $ docker-compose up -d  # start operation

At this point, resuming use of _Php-Server-Mon-Sys_ is very similar to the procedure described in the section above titled, _PHP Server Monitor_ _Initialization_.  Refer to that section.  At one point a page is displayed which displays:

  "We have discovered a previous version.  In the next step we will upgrade your database to the latest version".

This is normal for a restored _Php-Server-Mon-Sys_ system.  Choose _UPGRADE TO 3.1.1_.  Continue and _LOG IN_.  The _Php-Server-Mon-Sys_ continues normal operation per its configuration as when backed up.

## How To Uninstall _Php-Server-Mon-Sys_
To completely remove _Php-Server-Mon-Sys_, perform the following procedure:

  - Remove the running _Docker_ containers:

      $ docker-compose stop  # gracefully shut down the Docker containers

      $ docker-compose rm  # unload the Docker containers

  - Delete the _Php-Server-Mon-Sys_ _Home_ directory.  It is necessary to use _sudo_ or otherwise have superuser permissions in order to delete the _MySQL_ database.

  - After deleting the home directory, you may remove the unnecessary _Docker_ images from the local _Docker_ image repository, in order to reclaim the storage space:

    - Discover the local _Docker_ images using the command:

        $ docker images

      Their names are _mysql_, _nginx_, and _temp/php-fpm-psm_.  Note their _IMAGE IDs_.

    - One by one, remove the images from the _Docker_ image repository using the command:

        $ docker rmi IMAGE ID.

If you inadvertently uninstall _Php-Server-Mon-Sys_ without first using the _docker-compose rm_ command, you may manually "clean up" the orphaned _Docker_ containers by using _Docker_ commands:

  - Discover the orphaned _Docker_ containers by using the command:

        $ docker ps -a  # note the _CONTAINER IDs_

  - Remove the _Docker_ containers by using the command:

        $ docker rm -f <CONTAINER ID>

  See the _Docker_ documentation for details.

## Support
For questions and other support which are _specific to_ _PHP Server Monitor_, please see _PHP Server Monitor_ documentation and forum:

  - http://www.phpservermonitor.org/support/

For general questions which are _specific to_ _Php-Server-Mon-Sys_, (installation, configuration, container use/management, etc), you may send email to:

  - psms-support@addiscent.com

To request improved features, report bugs, or submit other software issues about _Php-Server-Mon-Sys_, please visit _Php-Server-Mon-Sys_ project's _Issues_ page on GitHub:

  - https://github.com/addiscent/php-server-mon-sys/issues

## Contribute To This Project
Please feel free to submit pull requests for improvements to this project.  The following comments are to potential contributors.

There are a number of project goals and requirements to be considered.

##### The Several Types And Needs Of _Users_
The dashboard _User_ is not the only intended user of _Php-Server-Mon-Sys_.  Any service (Ops) _Admin_ is also an important _User_.  Making the admin's job easier is one of the project's goals.  Likewise, any _Developer_ on this project is another important _User_; making the developer's job easier and more productive is also one of the goals of this project.  Those goals make this project a _DevOps_-oriented project.

##### Technical Design and Implementation Considerations
Before submitting pull requests, please familiarize yourself with at least basic _DevOps_ goals and strategies, and especially learn the advantages (and pitfalls) of implementation "the Docker way".

Among others, please learn and take advantage of the following principles and tactics.  These help with long-term goals, and are already a part of this project's implementation, in one form or another.  Areas where this project does not already comply with these goals are the areas which will be given priority for pull requests:

  * Simplification, in any way, which also satisfies the criterion listed below
  * Security: make worthwhile continuing attempts to reduce the attack surface of the system
  * Rugged Design: Fault-tolerant behaviors
  * RESTful APIs/Behavior: stateless. A sense of Idempotence applies here
  * Ephemeral compute instances: complimentary or coincident to RESTful
  * Microservices Architecture: Object Oriented, Domain Driven Design

Desirable Simplification also includes those improvements which make the architecture or codebase easier to understand and modify in the future, such as refactoring.

##### Other Requirements
Note that _Php-Server-Mon-Sys_ has been deployed to several private-hardware hosts running _Ubuntu 14.04_.  It has also been deployed to _EC2_ instances on _Amazon Web Services_, and to a _Droplet_ on _Digital Ocean_.  That type of deployment portability is an important requirement of this project.


## Etc
Licensed under Apache 2.0 License.

Copyright &copy; 2016 Rex Addiscentis
