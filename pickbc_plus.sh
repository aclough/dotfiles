#!/bin/bash

set -euo pipefail

cd ~/rhr/pick
docker-compose up -d
docker-compose exec rightpick bash -c '[[ $(stat -c %U /home/rhr/.config) == root ]] && sudo chown rhr:rhr /home/rhr/.config'

docker-compose exec rightpick ./rightpick/software/build.sh clean
cp -r ~/workspace/flir_venv build
time docker-compose exec rightpick ./rightpick/software/build.sh build -i
if [ $1 ]
then
    time docker-compose exec rightpick ./rightpick/software/build.sh runtests -j $1
fi
