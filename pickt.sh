#!/bin/bash

set -eo pipefail
cd ~/rhr/pick

docker-compose up -d

if [ ! $1 ]
then
    echo "Running with 1 thread"
    docker-compose exec rightpick ./rightpick/software/build.sh runtests
    ./software/build.sh runtests
else
    echo "Running with $1 threads"
    docker-compose exec rightpick ./rightpick/software/build.sh runtests -j$1
fi
