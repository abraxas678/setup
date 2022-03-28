#!/bin/bash
#### SSH
mkdir ~/.ssh
sudo rclone copy snas:sec/sshkeys ~/.ssh --include="id*" --include="me2" -P
sudo chmod 400 ~/.ssh/* -R
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
#rclone copy snas:sec . --include="me2*" -P
#mkdir /volume1
#mkdir /volume1/sec
#rclone copy snas:sec /volume1/sec --include rc --max-depth 1
#ssh-add ~/.ssh/me2
