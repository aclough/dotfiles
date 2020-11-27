#!/bin/sh

set -e

pickb.sh
echo "Built successfully"
rsync -ralu ~/rhr/pick/build rhr@$1:aclough

echo "Deploy successful"
