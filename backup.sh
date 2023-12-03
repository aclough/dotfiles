#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"
#
#

echo "Backing up Documents"
rclone sync -P ~/Documents gdrive:backup/Documents
echo "Backing up Picture"
rclone sync -P ~/Pictures gdrive:backup/Pictures
echo "Backing up Music"
rclone sync -P ~/Music gdrive:backup/Music
echo "Backing up Videos"
rclone sync -P ~/Videos gdrive:backup/Videos
echo "Backing up Calibre library"
rclone sync -P ~/Calibre\ Library gdrive:backup/Calibre\ Library
