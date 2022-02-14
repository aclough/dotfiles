#!/bin/bash

set -euo pipefail

pickb.sh
echo "Built successfully"
rsync -raluhP ~/rhr/pick/build rhr@"$1":aclough

echo "Deploy successful"
