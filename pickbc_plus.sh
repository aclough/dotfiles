#!/bin/bash

set -e

sudo service memcachedb restart
npm update

cd ~/rhr/pick

~/rhr/pick/software/build.sh clean
~/rhr/pick/software/build.sh build
~/rhr/pick/software/api/python/multibot/tools/generate_station_server_code.sh ~/rhr/swagger-codegen
