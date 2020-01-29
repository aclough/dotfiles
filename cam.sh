#!/bin/bash

set -e

sudo service memcachedb restart

can-i-merge --branch $1
