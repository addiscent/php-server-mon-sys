#!/bin/bash
# download phpservermon-3.1.1, untar it.  Files resting place is www/phpservermon
curl -L -o phpservermon-3.1.1.tar.gz https://sourceforge.net/projects/phpservermon/files/phpservermon/PHP%20Server%20Monitor%20v3.1.1/phpservermon-3.1.1.tar.gz/download \
&& mkdir src/public/ \
&& tar -C src/public/ -zxvf phpservermon-3.1.1.tar.gz \
&& mv src/public/phpservermon-3.1.1/ src/public/phpservermon/
