#!/bin/bash
clear
echo V2
sudo mkdir /volume1
sudo mkdir /volume2
sudo mkdir /volume1/sec
sudo mkdir /volume2/docker
sudo mkdir /volume2/docker_final
sudo apt update && sudo apt install -y curl unzip git wget nfs-common
sudo mount -t nfs 192.168.86.29:volume1/sec /volume1/sec -o nolock
sudo mount -t nfs 192.168.86.29:volume2/docker /volume2/docker -o nolock
sudo mount -t nfs 192.168.86.29:volume2/docker_final /volume2/docker_final -o nolock
echo
ls /volume1/sec
echo
cd $HOME
echo
#echo GITLESS
#echo; sleep 5
#wget https://github.com/gitless-vcs/gitless/releases/download/v0.8.8/gl-v0.8.8-linux-x86_64.tar.gz
#tar xf gl-v0.8.8-linux-x86_64.tar.gz
#cp ./gl-v0.8.8*/* /usr/local/bin/gl
#git config --global user.email abraxas678@gmail.com
#git config --global user.name abraxas678
#####################################################################################
#echo OH MY ZSH  - execute script again ater installation of zsh
#echo
#sleep 4
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
cd $HOME
git clone https://github.com/abraxas678/setup_new.git
cd setup_new
echo; echo $PWD; echo
chmod +x *
echo
echo "sudo apt install -y keepass2 tmux tmuxinator"
echo
sleep 3
sudo apt install -y keepass2 tmux tmuxinator bat
echo
echo RCLONE
echo
#echo SNAS PW
#read pw
#echo $pw >> pwtmp
#sleep 4
echo $PWD
sleep 3
echo
ip=$(hostname)
if [[ "$ip" = "LAPTOP-HR2FJQGL" ]]; then
  echo MOUNTING
  mkdir /mnt/t
  mkdir /volume1
  mkdir /volume2
  mount -t drvfs T: /mnt/t
  mount -t drvfs T: /volume2
  mount -t drvfs T: /volume1  
fi
sleep 5
echo
echo
source rclone_secure_setup.sh
#curl -L https://raw.githubusercontent.com/abraxas678/setup_new/master/rclone_secure_setup.sh | bash
echo
echo
echo $PWD
sleep 3
echo
#echo SSH KEYS
echo
#cd $HOME/setup_new
#sleep 5
echo
#bash setup_ssh.sh
#curl -L https://raw.githubusercontent.com/abraxas678/setup_new/master/setup_ssh.sh | bash
echo
#echo SSH done
#sleep 15
echo
echo FONTS
echo
sleep 5
#https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -X POST -H "Content-Type: application/json" -d '{"myvar1":"foo","myvar2":"bar","myvar3":"foobar"}' "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=304c57b5ddbd4c10b03b76fa97d44559&deviceNames=racer&text=play%20install%20this%20font&url=https%3A%2F%2Fgithub.com%2Fromkatv%2Fpowerlevel10k-media%2Fraw%2Fmaster%2FMesloLGS%2520NF%2520Regular.ttf&file=https%3A%2F%2Fgithub.com%2Fromkatv%2Fpowerlevel10k-media%2Fraw%2Fmaster%2FMesloLGS%2520NF%2520Regular.ttf&say=please%20install%20this%20font"
sudo apt update && sudo apt install -y zsh fonts-powerline xz-utils wget fd-find mlocate
###### https://github.com/suin/git-remind
################## GIT REMIND
cd $HOME; echo
echo GIT REMIND
sleep 3
mkdir git-remind
cd git-remind
echo
echo $PWD
echo
sleep 3
wget https://github.com/suin/git-remind/releases/download/v1.1.1/git-remind_1.1.1_Linux_x86_64.tar.gz
tar xf git-remind_1.1.1_Linux_x86_64.tar.gz
git config --global remind.paths '/volume2/docker_final/setup_new/*,/volume2/docker/utils/*,/root/*,/volume2/docker_final/jdownloader'
sleep 3
echo
#echo
#echo RCLONE ROOT_TAR BEGINNT
#echo
#sleep 5
#rclone copy gdsec:root_tar / -P -v --max-depth 1  --fast-list --skip-links
#cd /
#tar xf *root*.xz
#echo
#echo RCLONE TAR ENDE
#echo
#sleep 5
#rclone sync path: /usr/local/bin -P -v --skip-links --fast-list 
#cd /volume2/docker/utils
#mv path path_old
#git clone git@github.com:abraxas678/path.git
sudo mkdir /mytmp
cd /mytmp
sudo git clone git@github.com:abraxas678/root.git
rclone move /mytmp/root $HOME/ -P -v
cd $HOME
rm -rf setup_new
rm start.sh
rm git-remind*tar.gz*
rm gl*tar.gz*
cd $HOME
#exec zsh

