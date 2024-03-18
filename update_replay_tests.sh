#!/bin/bash

set -euo pipefail

cd ~/rhr/pick
docker compose up -d
docker compose exec rightpick bash -c '[[ $(stat -c %U /home/rhr/.config) == root ]] && sudo chown rhr:rhr /home/rhr/.config || true'

LOG_PATH=software/qa/data/logfiles

echo $LOG_PATH

docker compose exec rightpick mkdir -p replay_updates
for FILE in $(ls ~/rhr/pick/$LOG_PATH)
do
docker compose exec rightpick bash -c "source ./rightpick/build/deploy/env.sh; convert-replay-test-data --input ~/rightpick/$LOG_PATH/$FILE --output replay_updates/$FILE; cp replay_updates/$FILE ~/rightpick/$LOG_PATH/$FILE"
done
