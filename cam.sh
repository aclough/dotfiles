#!/bin/bash

set -e
unset PYTHONPATH

sudo service memcachedb restart

can-i-merge --branch $1
