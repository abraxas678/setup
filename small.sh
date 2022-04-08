#!/bin/bash
#clear
cd $HOME/setup
sudo chmod +x *.sh
echo SETUP SMALL
sudo apt install -y git
git config --global user.email abraxas678@gmail.com
git config --global user.name abraxas678
#####################################################################################
#echo OH MY ZSH  - execute script again ater installation of zsh
#echo
#sleep 4
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
cd $HOME
git clone https://github.com/abraxas678/setup.git
cd setup
echo; echo $PWD; echo
chmod +x *
echo
echo RCLONE
echo
#echo SNAS PW
#read pw
#echo $pw >> pwtmp
#sleep 4
echo $PWD
sleep 1
echo
#ip=$(hostname)
#if [[ "$ip" = "LAPTOP-HR2FJQGL" ]]; then
#  echo MOUNTING
#  mkdir /mnt/t
#  mkdir /volume1
#  mkdir /volume2
#  mount -t drvfs T: /mnt/t
#  mount -t drvfs T: /volume2
#  mount -t drvfs T: /volume1  
#fi
#sleep 5
#echo
cat $HOME/.config/rclone/rclone.conf
rclonesetup=y
echo
echo "START RCLONE SETUP?  (y/n)"
echo
read -t 10 -n 1 rclonesetup
#if [[ $rclonesetup = "y" ]]; then
source rclone_secure_setup.sh
#fi
#curl -L https://raw.githubusercontent.com/abraxas678/setup_new/master/rclone_secure_setup.sh | bash
echo
echo
echo $PWD
sleep 1
echo
sshsetup="y"
echo "START SSH SETUP?  (y/n)"
echo
read -t 10 -n 1 sshsetup
#if [[ $sshsetup = "y" ]]; then
echo SSH KEYS
echo
cd $HOME/setup
sleep 1
echo
source setup_ssh.sh
#curl -L https://raw.githubusercontent.com/abraxas678/setup_new/master/setup_ssh.sh | bash
echo
echo SSH done
sudo apt update && sudo apt install -y zsh fonts-powerline xz-utils wget  
###mlocate  -----> in tmu aufsetzen
###### https://github.com/suin/git-remind
################## GIT REMIND
cd $HOME; echo
#echo GIT REMIND
#sleep 3
#mkdir git-remind
#cd git-remind
#echo
echo $PWD
echo
sleep 1
#wget https://github.com/suin/git-remind/releases/download/v1.1.1/git-remind_1.1.1_Linux_x86_64.tar.gz
#tar xf git-remind_1.1.1_Linux_x86_64.tar.gz
#git config --global remind.paths '/volume2/docker_final/setup_new/*,/volume2/docker/utils/*,/root/*,/volume2/docker_final/jdownloader'
#git config --global remind.paths '$HOME/*,/setup/*,/volume2/docker_final/setup_new/*,/volume2/docker/utils/*,/root/*,/volume2/docker_final/jdownloader'
#sleep 3
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
chsh -s $(which zsh)
curl -L git.io/antigen > antigen.zsh
sudo mkdir /mytmp
cd $HOME
userhome=$HOME
git clone git@github.com:abraxas678/dotfiles.git
sudo mv $userhome/dotfiles /mytmp/
cd /mytmp
rclone move /mytmp/dotfiles/ $HOME/ -P -v
cd $HOME
sudo rm -rf /mytmp
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
brewsetup="y"
echo "START BREW SETUP?  (y/n)"
echo
read -t 10 -n 1 brewsetup
#if [[ $brewsetup = "y" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/abrax/.zprofile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential -y
  brew install gcc  
#fi
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install taskwarrior
sudo apt install python3-pip
pip3 install --user git+https://github.com/bergercookie/taskwarrior-syncall
