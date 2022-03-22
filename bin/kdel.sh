#!/bin/bash
myplaying=$(kodi_is_playing.sh long)
echo
source line
echo "DELETE $myplaing (y/n)"
read -n 1 myanswer
if [[ $myanswer = "y" ]];then
  rclone move $myplaing snas:downloads2/deleteme -Pv
fi
source line
