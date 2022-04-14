#!/bin/bash
source color.dat
printf "${BLUE3}"
#clear
cd $HOME/setup
sudo chmod +x *.sh
apt update
sudo apt update 
apt install sudo -y
sudo apt install git
sudo apt install -y nano curl wget nfs-common xclip keepassxc ssh-askpass
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt-get update
sudo apt-get dist-upgrade
printf "${BLUE1}"
echo
echo SETUP NEW
echo "======================"
printf "${GREEN}"
echo
echo "######################  MOUNT"
sleep 1
printf "${BLUE2}"
echo "MKDIR"
sudo mkdir /volume1
sudo mkdir /volume2
sudo mkdir /volume1/sec
sudo mkdir /volume1/supersec
sudo mkdir /volume2/docker
sudo mkdir /volume2/docker_final
sudo apt update && sudo apt install -y curl unzip git wget nfs-common jq
sudo mount -t nfs 192.168.86.29:volume1/sec /volume1/sec -o nolock
sudo mount -t nfs 192.168.86.29:volume1/suprsec /volume1/supersec -o nolock
sudo mount -t nfs 192.168.86.29:volume2/docker /volume2/docker -o nolock
sudo mount -t nfs 192.168.86.29:volume2/docker_final /volume2/docker_final -o nolock
printf "${GREEN}"
echo "################################################### GIT"
sleep 1
git config --global user.email abraxas678@gmail.com
git config --global user.name abraxas678
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
printf "${GREEN}"
echo "##################### CLONE /SETUP"
sleep 1
printf "${BLUE2}"
cd $HOME
git clone https://github.com/abraxas678/setup.git
cd setup
echo; echo $PWD; echo
chmod +x *
echo
sudo mkdir ~/.config
sudo mkdir ~/.config/keepassxc
sudo chown abraxas678: /home/abraxas678/.config -R
printf "${GREEN}"
echo "############################# APT"
printf "${BLUE2}"
echo "sudo apt install -y tmux tmuxinator bat"
sudo apt install -y tmux tmuxinator bat 
echo
printf "${GREEN}"
echo "#################################### RCLONE"
printf "${BLUE2}"
sleep 1
echo
echo $PWD
echo
echo
printf "${BLUE1}"
echo ".conf vor setup:"
echo
cat $HOME/.config/rclone/rclone.conf
echo
printf "${GREEN}"
echo "START RCLONE SETUP?  (y/n)"
echo
printf "${BLUE2}"
rclonesetup="n"
echo "default: n  --  t 10"
read -t 10 -n 1 rclonesetup
if [[ $rclonesetup = "y" ]]; then
   echo starting rclone setup
   sleep 5
   source rclone_secure_setup.sh
fi
#curl -L https://raw.githubusercontent.com/abraxas678/setup_new/master/rclone_secure_setup.sh | bash
echo
echo
echo $PWD
echo
#sshsetup="n"
#printf "${GREEN}"
#echo "##################  SSH SETUP"
#sleep 1
#echo "START SSH SETUP?  (y/n)"
#echo
#sshsetup="n"
#printf "${BLUE3}"
#read -t 10 -n 1 sshsetup
#if [[ $sshsetup = "y" ]]; then
#  echo SSH KEYS - starting setup
#  sleep 5
#echo
#cd $HOME/setup
#sleep 1
#echo
#source setup_ssh.sh
##curl -L https://raw.githubusercontent.com/abraxas678/setup_new/master/setup_ssh.sh | bash
#echo
#echo SSH done
#sleep 1
#fi
echo
echo FONTS
echo
#https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -X POST -H "Content-Type: application/json" -d '{"myvar1":"foo","myvar2":"bar","myvar3":"foobar"}' "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=304c57b5ddbd4c10b03b76fa97d44559&deviceNames=razer,Chrome,ChromeRazer&text=play%20install%20this%20font&url=https%3A%2F%2Fgithub.com%2Fromkatv%2Fpowerlevel10k-media%2Fraw%2Fmaster%2FMesloLGS%2520NF%2520Regular.ttf&file=https%3A%2F%2Fgithub.com%2Fromkatv%2Fpowerlevel10k-media%2Fraw%2Fmaster%2FMesloLGS%2520NF%2520Regular.ttf&say=please%20install%20this%20font"
sudo apt update && sudo apt install -y zsh fonts-powerline xz-utils wget  
###mlocate  -----> in tmu aufsetzen
###### https://github.com/suin/git-remind
#sleep 1
################## GIT REMIND
cd $HOME; echo
######################################   EINSTELLUNGEN
chsh -s $(which zsh)
curl -L git.io/antigen > antigen.zsh
sudo mkdir /mytmp
cd $HOME
userhome=$HOME
echo
printf "${GREEN}"
eval $(ssh-agent)
####################################################################################
echo $SSH_AUTH_SOCK
echo $SSH_AUTH_SOCK | clip.exe
cp ~/setup/keepassxc.ini ~/.config/keepassxc/
echo DO NOT CLOSE KEEPASSXC -- CHECK SETTINGS KEYS 
echo "BUTTON 120"
read -t 120 me
keepassxc &
echo
echo KEY WHEN DONE
read me
echo "#####################################################  DOTFILES"
printf "${BLUE2}"
echo
cd $HOME
rm -rf ~/dotfiles
git clone git@github.com:abraxas678/dotfiles.git
sudo mv $userhome/dotfiles /mytmp/
cd /mytmp
rclone move /mytmp/dotfiles/ $HOME/ -P -v
cd $HOME
sudo rm -rf /mytmp
printf "${GREEN}"
echo
echo "############################################################ ANTIGEN"
printf "${BLUE2}"
mkdir ~/.antigen/bundles/
mkdir ~/.antigen/bundles/robbyrussell/
cd ~/.antigen/bundles/robbyrussell/
git clone https://github.com/robbyrussell/oh-my-zsh.git
mkdir ~/.antigen/bundles/romkatv/
git clone https://github.com/romkatv/powerlevel10k.git
cd $HOME
#rm start.sh
#rm git-remind*tar.gz*
#rm gl*tar.gz*
#cd $HOME
#exec zsh
rm -rf $HOME/.antigen
echo
printf "${GREEN}"
echo "######################################################## BREW"
printf "${BLUE2}"
echo
brewsetup="y"
echo "START BREW SETUP?  (y/n)"
echo
read -t 10 -n 1 brewsetup
if [[ $brewsetup != "n" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/abrax/.zprofile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential -y
  brew install gcc  
fi
#############################################################
sudo apt install -y taskwarrior android-tools-adb
#sudo apt install -y python3-pip
#pip3 install --user git+https://github.com/bergercookie/taskwarrior-syncall

brew install fd
brew install fzf
brew install thefuck
$(brew --prefix)/opt/fzf/install
sudo apt-get install conky-all -y
brew install gcalcli
rm $HOME/setup -rf
cd /
sudo git clone https://github.com/abraxas678/setup.git
sudo apt autoremove
exec zsh
