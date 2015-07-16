#!/bin/bash
# Pull required images, install PSM3.1.1 files, and build php-fpm docker image

# docker will skip downloading these images if they already exist
# in the local repository on this host
docker pull nginx:1.9.2 && \
docker pull mysql:5.7.7 && \

# unzip the PHP Server Monitor sub-directory tree.  This tree is
# copied into the PHP-FPM container during docker build
tar -zxvf phpservermon-3.1.1.tar.gz && \

# build the PHP Server Monitor PHP-FPM docker image
docker build -t temp/php-fpm-psm:0.0.0 .

echo "Installation complete"
