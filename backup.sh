#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"
#
#

echo "Backing up Documents"
rclone copy -P ~/Documents gdrive:backup/Documents --update
echo "Backing up Picture"
rclone copy -P ~/Pictures gdrive:backup/Pictures --update
echo "Backing up Music"
rclone copy -P ~/Music gdrive:backup/Music --update
echo "Backing up Videos"
rclone copy -P ~/Videos gdrive:backup/Videos --update
echo "Backing up Calibre library"
rclone copy -P ~/Calibre\ Library gdrive:backup/Calibre\ Library --update
