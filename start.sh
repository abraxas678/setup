#!/bin/bash
echo
echo GESTARTET MIT X11 UNTERSTÜTZUNG?
echo
echo "<<<BUTTON>>>"
echo
read me
echo "APT UPDATE && UPGRADE"
echo
sleep 1
echo; echo
echo "sudo apt update && sudo apt upgrade -y"
echo
sudo apt update && sudo apt upgrade -y
echo
echo "INSTALL GIT WGET"
echo
sleep 1
sudo apt install git wget -y
cd $HOME
rm -rf $HOME/setup
echo
echo "CLONE setup.git"
echo
sleep 1
git clone https://github.com/abraxas678/setup.git
cd $HOME/setup
chmod +x *.sh
echo
echo "SETUP.SH"
echo
sleep 1
./setup.sh
