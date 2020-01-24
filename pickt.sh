#!/bin/bash
unset PYTHONPATH
if [ ! $1 ]
then
    echo "Running with default 4 threads"
    ~/rhr/pick/software/build.sh runtests -j4
else
    echo "Running with $1 threads"
    ~/rhr/pick/software/build.sh runtests -j$1
fi
~/rhr/pick/software/build.sh lint
