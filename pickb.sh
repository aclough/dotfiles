#!/bin/bash

set -e

unset PYTHONPATH

~/rhr/pick/software/build.sh build -i
if [ ! $1 ]
then
    pickt.sh
fi
