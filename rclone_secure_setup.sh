#!/bin/bash
clear
sudo chmod 777 ./ -R
echo $PWD
echo SETUP SECURE RCLONE
sleep 5
curl https://rclone.org/install.sh | sudo bash
echo "[snas]" > rclone.conf
echo "type = sftp" >> rclone.conf
echo "host = abraxas678.synology.me" >> rclone.conf
echo
echo "user = abraxas678" >> rclone.conf
echo "port = 22" >> rclone.conf
echo "SNAS PW:"
#exec 0</dev/tty 
read pw
#count=${#pw}
#echo "count $count"
#while [ $count -le 10 ]; do
#  echo count $count
#  echo "WRONG PASSWORD"
#  exec 0</dev/tty 
#  read pw   
#  count=${#pw}
#done
clear
pw2=$(rclone obscure $pw)
clear
echo -n "pass = " >> rclone.conf
echo $pw2 >> rclone.conf
echo "use_insecure_cipher = false" >> rclone.conf
echo
sudo mkdir ~/.config
sudo 
sudo mkdir ~/.config/rclone
sudo mv rclone.conf ~/.config/rclone/
echo
echo RCLONE.CONF SETTINGS
cat ~/.config/rclone/rclone.conf
echo
echo
sleep 5
#apt update && apt install -y rclone
#sudo mkdir /mnt
sudo mkdir /volume1
sudo mkdir /volume1/sec
#rclone mount /mnt/volume1 snas:sec
#####################################################################
sudo mount -t nfs 192.168.86.29:volume1/sec /volume1/sec -o nolock
###########################################################################
###########################################################################
export RCLONE_PASSWORD_COMMAND="/volume1/sec/get_pw.sh"
###################################################################
echo
ls /volume1/sec/get_pw.sh
sleep 5
myrc=$(rclone lsf snas:sec/rclone | sed 's/.*__//' | sed 's/\..*//' | sort -r | head -n 1); 
myrc2=$(rclone lsf snas:sec/rclone --include "*$myrc*");
echo $myrc2
echo "rclone copy snas:sec/rclone . --include=$myrc2"
rclone copy snas:sec/rclone . --include="$myrc2"
sudo mv $myrc2 ~/.config/rclone/rclone.conf

