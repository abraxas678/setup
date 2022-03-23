#!/bin/bash
### CREATE NFO FILES IN THIS FOLDER - BASED ON FILE NAME
#tmuxinator start auto
#tmux send -t auto:0.2 spinner.sh; enter
base=$PWD
source ts.sh
sudo mkdir /work
sudo chmod 777 /work -R
echo counting files
##############################   sudo rclone lsf . -R | wc -l > filecount1
echo "/" > /work/folder-$ts   
sudo rclone lsf . --files-only  --include "*.mp4" -R >> /work/files-$ts 
#cat  /work/files-$ts  
while read line1; do 
    filename=$(echo $line1 | sed 's/.*\///' | sed 's/.mp4.*//')
    filepath=$(echo $line1 | sed "s/$filename.mp4//")
 #   echo LINE1 $line1
     echo FILENAME $filename
 #   echo PATH $filepath
     sudo rclone copyto /volume2/downloads2/template.nfo ./$filepath$filename.nfo
    sed -i "s/RKOREPLACE/$filename/g" ./$filepath$filename.nfo
done </work/files-$ts

#############################              rclone lsf . -R | wc -l > filecount2

echo
echo filecount before $(cat filecount1) and now: $(cat filecount2)
sudo rm filecount*
sudo rm /work/files-$ts

