#!/bin/bash
if [ ! $1 ]
then
    echo "Running with default 4 threads"
    ~/rhr/pick/software/build.sh runtests
else
    echo "Running with $1 threads"
    ~/rhr/pick/software/build.sh runtests -j$1
fi
