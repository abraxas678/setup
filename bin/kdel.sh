#!/bin/bash
myplaying=$(kodi_is_playing.sh long)
echo
source line
echo "DELETE $myplaying (y/n)"
read -n 1 myanswer
if [[ $myanswer = "y" ]];then
  rclone move "$myplaying" snas:downloads2/deleteme -Pv
fi
source line
