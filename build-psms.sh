#!/bin/bash
# Pull required images from DockerHub.
# Build local php-fpm docker image.
# Start up PSMS

# docker will skip downloading these images if they already exist
# in the local repository on this host
docker pull raddiscentis/php-fpm:0.0.1 && \
docker pull nginx:1.9.2 && \
docker pull mysql:5.7.7 && \

# build the PHP Server Monitor PHP-FPM docker container image
./build-php-fpm.sh && \

# start up PSMS
#docker-compose up -d

echo "Docker container images installation complete"
