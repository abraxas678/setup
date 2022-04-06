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
sudo apt install -y nano curl wget nfs-common xclip
printf "${BLUE1}"
echo SETUP NEW
echo "======================"
printf "${GREEN}"
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
sudo apt update && sudo apt install -y curl unzip git wget nfs-common
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
printf "${GREEN}"
echo "############################# APT"
printf "${BLUE2}"
echo "sudo apt install -y keepass2 tmux tmuxinator bat"
sudo apt install -y keepass2 tmux tmuxinator bat 
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
read -t 10 -n 1 rclonesetup
if [[ $rclonesetup = "y" ]]; then
  source rclone_secure_setup.sh
fi
#curl -L https://raw.githubusercontent.com/abraxas678/setup_new/master/rclone_secure_setup.sh | bash
echo
echo
echo $PWD
echo
sshsetup="y"
printf "${GREEN}"
echo "##################  SSH SETUP"
sleep 1
echo "START SSH SETUP?  (y/n)"
echo
printf "${BLUE3}"
read -t 10 -n 1 sshsetup
if [[ $sshsetup = "y" ]]; then
  echo SSH KEYS
echo
cd $HOME/setup
sleep 1
echo
source setup_ssh.sh
#curl -L https://raw.githubusercontent.com/abraxas678/setup_new/master/setup_ssh.sh | bash
echo
echo SSH done
sleep 1
fi
echo
echo FONTS
echo
#https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -X POST -H "Content-Type: application/json" -d '{"myvar1":"foo","myvar2":"bar","myvar3":"foobar"}' "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=304c57b5ddbd4c10b03b76fa97d44559&deviceNames=razer,Chrome,ChromeRazer&text=play%20install%20this%20font&url=https%3A%2F%2Fgithub.com%2Fromkatv%2Fpowerlevel10k-media%2Fraw%2Fmaster%2FMesloLGS%2520NF%2520Regular.ttf&file=https%3A%2F%2Fgithub.com%2Fromkatv%2Fpowerlevel10k-media%2Fraw%2Fmaster%2FMesloLGS%2520NF%2520Regular.ttf&say=please%20install%20this%20font"
sudo apt update && sudo apt install -y zsh fonts-powerline xz-utils wget  
###mlocate  -----> in tmu aufsetzen
###### https://github.com/suin/git-remind
sleep 1
################## GIT REMIND
cd $HOME; echo
#echo GIT REMIND
#sleep 3
#mkdir git-remind
#cd git-remind
#echo
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
######################################   EINSTELLUNGEN
chsh -s $(which zsh)
curl -L git.io/antigen > antigen.zsh
sudo mkdir /mytmp
cd $HOME
userhome=$HOME
#####################################################  DOTFILES
git clone git@github.com:abraxas678/dotfiles.git
sudo mv $userhome/dotfiles /mytmp/
cd /mytmp
rclone move /mytmp/dotfiles/ $HOME/ -P -v
cd $HOME
sudo rm -rf /mytmp
############################################################ ANTIGEN
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
######################################################## BREW
brewsetup="y"
echo "START BREW SETUP?  (y/n)"
echo
read -t 10 -n 1 brewsetup
if [[ $brewsetup = "y" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/abrax/.zprofile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential -y
  brew install gcc  
fi
#############################################################
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install
sudo apt install taskwarrior
sudo apt install python3-pip
pip3 install --user git+https://github.com/bergercookie/taskwarrior-syncall

echo"taskd.certificate=/volume1/sec/sshkeys/tasks/private.certificate.pem
taskd.key=/volume1/sec/sshkeys/tasks/private.key.pem
taskd.ca=/volume1/sec/sshkeys/tasks/ca.cert.pem
taskd.server=inthe.am:53589
taskd.credentials=inthe_am/amdamdes/3136474f-af8b-468c-9849-9798747c33c1
taskd.trust=strict" >> ~/.taskrc
sudo apt autoremove
exec zsh
