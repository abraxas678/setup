#!/bin/bash
sudo update && sudo apt install git curl wget nano -y
cd $HOME
git clone https://github.com/abraxas678/setup.git
cd setup
./setup.sh
