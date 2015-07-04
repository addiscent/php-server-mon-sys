#!/bin/bash
# build the nginx image
cd ./images/nginx && \
docker build -t tutorial/nginx . && \
cd -
