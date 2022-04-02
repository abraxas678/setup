#!/bin/bash
#### SSH
sudo chmod 777 ~/.ssh/* -R
mkdir ~/.ssh
rclone copy snas:sec/sshkeys ~/.ssh --include="id*" --include="me2" -P --max-depth 3
sudo chmod 400 ~/.ssh/* -R
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
sudo chmod 777 ~/.ssh/* -R
rclone copy snas:sec ~/.ssh --include="me2*" -P --max-depth 3
sudo chmod 400 ~/.ssh/* -R
#mkdir /volume1
#mkdir /volume1/sec
#rclone copy snas:sec /volume1/sec --include rc --max-depth 1
ssh-add ~/.ssh/me2
ssh-add ~/.ssh/id_rsa_APR
