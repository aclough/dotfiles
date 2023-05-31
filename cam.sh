#!/bin/bash

set -eo pipefail

cd ~/rhr/pick
docker-compose up -d

time docker-compose exec rightpick bash -c "source ./rightpick/build/deploy/env.sh; can-i-merge $1"

