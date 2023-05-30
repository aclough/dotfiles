#!/bin/bash

set -euo pipefail

pickb.sh
echo "Built successfully"
for bot in "$@"
do
    rsync -raluhP ~/rhr/pick/build rhr@"$bot":aclough
done

echo "Deploy successful"
