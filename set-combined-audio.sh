#!/bin/sh

pactl load-module module-combine-sink
pactl set-default-sink combined
