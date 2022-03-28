#!/bin/bash
echo "restore latest rclone.conf file?  (y/n)"
read myrestore
if [[ $myrestore = "y" ]]; then
  myrc=$(rclone lsf snas:sec/rclone | sed 's/.*__//' | sed 's/\..*//' | sort -r | head -n 1);
  myrc2=$(rclone lsf snas:sec/rclone --include "*$myrc*");
  echo $myrc2
  echo "rclone copy snas:sec/rclone . --include=$myrc2"
  rclone copy snas:sec/rclone . --include="$myrc2"
  sudo mv $myrc2 ~/.config/rclone/rclone.conf
fi
