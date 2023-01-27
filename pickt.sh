#!/bin/bash

set -eo pipefail
cd ~/rhr/pick

docker-compose up -d

if [ ! $1 ]
then
    docker-compose exec rightpick ./rightpick/software/build.sh runtests
else
    echo "Running $1 test"
    docker-compose exec rightpick ./rightpick/software/build.sh runtests -R $1
fi
