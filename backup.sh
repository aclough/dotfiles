#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"

echo "Backing up Wappapers"
rclone sync -P ~/Pictures/Wallpapers gdrive:backup/Pictures/Wallpapers
