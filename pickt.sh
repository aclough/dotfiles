#!/bin/bash

set -eo pipefail
cd ~/rhr/pick

docker-compose up -d

if [ ! $1 ]
then
    docker-compose exec rightpick ./rightpick/software/build.sh runtests
else
    echo "Running $1 test"
    if [[ "$1" == *:* ]];
    then
        echo "In extended tests"
        docker-compose exec rightpick ./rightpick/software/build.sh alltests -R $1
    else
        docker-compose exec rightpick ./rightpick/software/build.sh runtests -R $1
    fi
fi
