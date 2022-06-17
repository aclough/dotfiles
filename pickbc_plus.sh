#!/bin/bash

set -euo pipefail

docker-compose up -d

sudo service memcachedb restart
npm update

cd $RIGHTPICK_ROOT
./software/build.sh clean
./software/build.sh build
