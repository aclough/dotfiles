#!/bin/bash

set -euo pipefail

pickb.sh
echo "Built successfully"
cp ~/workspace/setup.sh ~/rhr/pick/build
cp ~/workspace/env.sh ~/rhr/pick/build
cp ~/workspace/pick.sh ~/rhr/pick/build
for bot in "$@"
do
    rsync -raluhP ~/rhr/pick/build rhr@"$bot":aclough
done

echo "Deploy successful"
