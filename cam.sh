#!/bin/bash

set -eo pipefail

cd ~/rhr/pick
docker-compose up -d

docker-compose exec rightpick bash -c "export RIGHTPICK_PLATFORM=v3; ls; source ./rightpick/build/deploy/env.sh; can-i-merge $1"

