#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"
#
#

echo "Backing up Documents"
rclone copy ~/Documents gdrive:backup/Documents
echo "Backing up Picture"
rclone copy ~/Pictures gdrive:backup/Pictures
echo "Backing up Music"
rclone copy ~/Music gdrive:backup/Music
echo "Backing up Videos"
rclone copy ~/Videos gdrive:backup/Videos
