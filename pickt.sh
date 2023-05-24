#!/bin/bash

set -eo pipefail
cd ~/rhr/pick

docker-compose up -d

if [ $2 ]
then
    echo "Just running $2"
    export PYTEST_ADDOPTS="-k $2"
fi

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
        docker-compose exec --env PYTEST_ADDOPTS="${PYTEST_ADDOPTS}" rightpick ./rightpick/software/build.sh runtests -R $1
    fi
fi
