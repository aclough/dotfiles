#!/bin/bash

set -eo pipefail

cd $RIGHTPICK_ROOT
if [ ! $1 ]
then
    echo "Running with default 4 threads"
    ./software/build.sh runtests
else
    echo "Running with $1 threads"
    ./software/build.sh runtests -j$1
fi
