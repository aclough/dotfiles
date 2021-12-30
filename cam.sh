#!/bin/bash

set -eo pipefail

sudo service memcachedb restart

can-i-merge --branch "$1"
