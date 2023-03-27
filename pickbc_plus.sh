#!/bin/bash

set -euo pipefail

cd ~/rhr/pick
docker-compose up -d

docker-compose exec rightpick ./rightpick/software/build.sh clean
docker-compose exec rightpick ./rightpick/software/build.sh build -i
if [ $1 ]
then
    docker-compose exec rightpick ./rightpick/software/build.sh runtests -j $1
fi
