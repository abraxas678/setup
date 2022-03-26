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
echo rclone -i --backup-dir $3$mytrennerbackup/$(date +"%s")/ -Pv --fast-list $1 $2 $3 $4 $5 $6 $7 $8 
echo
read -t 90 me
rclone -i --backup-dir $3$mytrennerbackup/$(date +"%s")/ -Pv --fast-list $1 $2 $3 $4 $5 $6 $7 $8 $9


