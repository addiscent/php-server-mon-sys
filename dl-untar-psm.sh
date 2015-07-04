#!/bin/bash
# download phpservermon-3.1.1, untar it, files rest in www/phpservermon
curl -L -o phpservermon-3.1.1.tar.gz https://sourceforge.net/projects/phpservermon/files/phpservermon/PHP%20Server%20Monitor%20v3.1.1/phpservermon-3.1.1.tar.gz/download \
&& mkdir www/ \
&& tar -C www/ -zxvf phpservermon-3.1.1.tar.gz \
&& mv www/phpservermon-3.1.1/ www/phpservermon/

