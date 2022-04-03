#!/bin/bash
sudo update && sudo apt install git curl wget nano -y
cd $HOME
rm -rf $HOME/setup
git clone https://github.com/abraxas678/setup.git
cd $HOME/setup
./setup.sh
