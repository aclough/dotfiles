#!/bin/bash

set -euo pipefail


RIGHTPICK_SOURCE=~/rhr/pick
bot=$1
COMMAND="source /home/rhr/rightpick/build/deploy/env.sh"

cd $RIGHTPICK_SOURCE
docker-compose up -d

if [[ -n ${bot} ]]
then
   echo "Copying machine.yaml from ${bot} to ${RIGHTPICK_SOURCE}/default_rightpick_configuration/machine.yaml.${bot}"
   rm -rf ./default_rightpick_configuration/*
   rsync ${bot}:/configuration/rightpick/* ./default_rightpick_configuration
fi
COMMAND="${COMMAND}; LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGL.so live-viewer"
docker-compose exec rightpick bash -c "${COMMAND}"
