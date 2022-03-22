#!/bin/bash
clear
if [[ $3 = *":"* ]]; then
  mydest=$(echo $3 | sed 's/:.*//')
  mytrenner=":"
else
  mydest=$(dirname "$3")
  mytrenner="/"
fi
echo mydest $mydest
echo
rclone -i --backup-dir $3$mytrenner/backup/$(date +"%s")/ -Pv --fast-list $1 $2 $3 $4
