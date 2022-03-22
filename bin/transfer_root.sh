#!/bin/bash
clear
echo
echo "[1] this is the sender"
echo "[2] this is the receiver"
echo
read choice
ts=$(ts.sh)
######
if [[ "$choice" = "1" ]]; then
###################### sender
  clear
  echo
  echo SENDER
  echo
  XZ_OPT=-9 tar --exclude="*/.git" -Jcvf $ts-root.tar.xz /root/
  rclone move . sec:root_tar -P -v --include="$ts-root.tar.xz" --skip-links --fast-list
  echo sec:root_tar
  echo $ts-root.tar.xz
elif [[ "$choice" = "2" ]]; then
  clear
  echo
  echo RECEIVER
  echo
  cd /root/
  myname=$(lsf sec:root_tar --exclude="/*old*/" | sort -r | head -n1)
  rclone copy sec:root_tar / --include="$myname" --skip-links --fast-list --max-depth 1 -P
  cd /
  tar -xvf $ts-root.tar.xz
else
  echo wrong choice
fi
echo
echo sec:root_tar
echo $ts-root.tar.xz 
echo
echo $ts
