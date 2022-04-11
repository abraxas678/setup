#!/bin/bash
echo
echo GESTARTET MIT X11 UNTERSTÜTZUNG?
echo BUTTON
echo
read me
sudo apt update && sudo apt install git curl wget nano -y
cd $HOME
rm -rf $HOME/setup
git clone https://github.com/abraxas678/setup.git
cd $HOME/setup
./setup.sh
