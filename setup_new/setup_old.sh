a#!/bin/bash
#v2
clear
mystartfolder=$PWD
echo V2
echo $mystartfolder
read -t 1 me
echo "[snas]" > rclone.conf
echo "type = sftp" >> rclone.conf
#echo "type = ftp" >> rclone.conf
#echo -n "host = 192.168.86." >> rclone.conf
echo "host = abraxas678.synology.me" >> rclone.conf
echo
#echo "last two digits of IP"
#read ip
#echo $ip >> rclone.conf
echo "user = abraxas678" >> rclone.conf
echo "port = 22" >> rclone.conf
#echo "port = 21" >> rclone.conf
echo "SNAS PW:"
read pw
echo
echo "INSTALL SHH SERVER?"
read -n 1 server_install
if [[ $server_install = "y" ]];then
  echo yes > /volume2/docker_final/setup_new/server_install
  printf "${RED}"
  printf "${BBLUE}"
  echo
  echo "SSH SERVER STARTEN? (y/n)"
  printf "${RED}"
  read -n 1 server_start
    if [[ $server_start = "y" ]];then
      echo yes > /volume2/docker_final/setup_new/server_start
    else
      echo no > /volume2/docker_final/setup_new/server_start
    fi
else
  echo no > /volume2/docker_final/setup_new/server_install
fi
pw2=$(rclone obscure $pw)
sleep 1
clear
echo -n "pass = " >> rclone.conf
echo $pw2 >> rclone.conf
echo "use_insecure_cipher = false" >> rclone.conf
echo
mkdir ~/.config
mkdir ~/.config/rclone
mv rclone.conf ~/.config/rclone/
echo
echo RCLONE.CONF SETTINGS
cat ~/.config/rclone/rclone.conf
echo
echo
###########################################################################
apt update && apt install -y curl nfs-common tmux tmuxinator
curl https://rclone.org/install.sh | sudo bash
###########################################################################
export EDITOR="nano"
export PROMPT_COMMAND='echo -ne "\033]0;SETUP_NEW@$name\007"'
export PS1="$PWD:: "
export RCLONE_PASSWORD_COMMAND="/volume1/sec/get_pw.sh"
echo
#####erst mount
echo get setup_clone.sh
rclone copy snas:docker_final/setup_new/ /volume2/docker_final/ --include setup_clone.sh -P
#echo get setup_new.yml
#rclone copy snas:docker_final/setup_new/ /root/.config/tmuxinator/1 --include setup_new.yml -P
cp /volume2/docker_final/setup_clone.sh /usr/local/bin 
chmod +x /volume2/docker_final/*.*sh
chmod +x /usr/local/bin/*.*sh
#tmuxinator start setup_new
#tmux send -t MAIN:0.0 NULL
#tmux send -t MAIN:1.0 EINS
#printf "${RED}BUTTON ${BLUE}"
#read -t 2 me
#rclone copy snas:sec /volume1/sec --include rc --max-depth 1 --fast-list --skip-links
#rclone copy snas:docker/utils/path /usr/local/bin --include "color.dat" --include "echo_name.sh" --include "create_ps1.sh" --include "name.dat" --include "enter.sh" --include="mount.sh" --include="alias.dat" -P --max-depth 1 --fast-list --skip-links 
printf "${BBLUE}"
printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
/usr/local/bin/echo_name.sh GET PATH .SH .DAT
###################################################################
printf "${BLUE}"
rclone copy snas:docker/utils/path /usr/local/bin --include "*.dat" --include "*.sh" --include "color.dat" --include "echo_name.sh" --include "create_ps1.sh" --include "name.dat" --include "enter.sh" --include="mount.sh" --include="alias.dat" -P --max-depth 1 --fast-list --skip-links 
source /usr/local/bin/name.dat
source /usr/local/bin/color.dat
printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
/usr/local/bin/echo_name.sh DOTFILES
###################################################################
printf "${BLUE}"
rclone copy snas:sec/dotfiles /root -P  --fast-list --skip-links
source ~/.bashrc
chmod +x /usr/local/bin/*
#### MOUNT
printf "${BBLUE}"
###################################################################
/usr/local/bin/echo_name.sh MOUNT.SH
###################################################################
printf "${BLUE}"
/usr/local/bin/mount.sh
echo
#### rclone latest backup
echo
printf "${BBLUE}"
###################################################################
/usr/local/bin/echo_name.sh RCLONE.CONF
###################################################################
printf "${BLUE}"
echo
myrc=$(rclone lsf snas:sec/rclone | sed 's/.*__//' | sed 's/\..*//' | sort -r | head -n 1); 
myrc2=$(rclone lsf snas:sec/rclone --include "*$myrc*");
printf "${BBLUE}"
echo $myrc2
printf "${BLUE}"
echo "rclone copy snas:sec/rclone . --include=$myrc2"
rclone copy snas:sec/rclone . --include="$myrc2"
rm /volume1/sec/rc
mv $myrc2 ~/.config/rclone/rclone.conf
echo
##########################sh /usr/local/bin/enter.sh &
echo
mkdir /volume1
mkdir /volume1/sec
#### SSH
echo
printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
/usr/local/bin/echo_name.sh SSH KEY SETUP
###################################################################
printf "${BLUE}"
echo
rclone copy snas:sec . --include="id_rsa*" -P --fast-list --skip-links
mkdir ~/.ssh
mv ./sshkeys/id* ~/.ssh/
chmod 400 ~/.ssh/*
chmod 400 /root/.ssh/id_rsa
eval `ssh-agent -s`
mv ~/.ssh/sshkeys/id_rsa* ~/.ssh/
ssh-add ~/.ssh/id_rsa
rm -rf  ~/.ssh/sshkeys
echo
#### GIT
printf "${BBLUE}"
printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
/usr/local/bin/echo_name.sh GIT SETUP
###################################################################
printf "${BLUE}"
apt install -y git git-lfs
git config --global user.email abraxas678@gmail.com
git config --global user.name abraxas678
cd /root
git init
git remote add origin git@github.com:abraxas678   
git remote set-url origin git@github.com:abraxas678/root.git
mkdir /volume2
mkdir /volume2/docker
cd /volume2/docker
echo
printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
/usr/local/bin/echo_name.sh COPY ROOT FOLDER
###################################################################
printf "${BLUE}"
source setup_new_root.sh
echo
#cd ~/.config
#printf "git clone git@github.com:abraxas678/${RED}config${BBLUE}.git"; echo
#git clone git@github.com:abraxas678/config.git
#printf "${BLUE}"
#mv ./config/.bashrc ~/.bashrc
#mkdir  /volume2/tmp_config
#rclone move ./config/ /volume2/tmp_config/ -P --fast-list --skip-links
#rclone move  /volume2/tmp_config/ /root/.config -P --fast-list --skip-links
#rm -rf config
#echo
#cd ~/.config
#echo 
#printf "${BBLUE}"
#echo $PWD
#echo GIT INIT
#printf "${BLUE}"
#git init
#git remote add origin master

#+printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
#+/usr/local/bin/echo_name.sh GIT STATUS _ ADD _ COMMIT _ PUSH
###################################################################
#+printf "${BLUE}"
#+echo
#+git status
#+echo 
#+git add .
#+echo
#+git commit -a -m 'auto commit'
#+echo
#git push --set-upstream origin master
#echo
#printf "${RED}BUTTON ${BLUE}" 20
#read -t 20 me
#printf "${BBLUE}"
#echo "rclone copy /volume2/docker/utils/path /usr/local/bin -P"
#printf "${BLUE}"
#rclone copy /volume2/docker/utils/path /usr/local/bin -P --fast-list --skip-links
#chmod +x /usr/local/bin/*
#source /root/.bashrc
printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
/usr/local/bin/echo_name.sh APT INSTALL ZSH GIT-EXTRAS
###################################################################
printf "${BLUE}"
echo
apt install -y zsh git-extras 
cd /volume2/docker_final/
echo
printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
/usr/local/bin/echo_name.sh SSH SERVER INSTALL
###################################################################
printf "${BLUE}"
if [[ $(cat /volume2/docker_final/setup_new/server_install) = "yes" ]];then
  echo
  printf "${BBLUE}"
  echo "apt install -y  openssh-server"
  printf "${BLUE}"
  apt install openssh-server
  #systemctl status ssh
  #service ssh stop
  myname=$(cat /usr/thisismyname) 
  count=${#myname}
	if [[ $count -lt 2 ]]; then
	  ip=$(hostname)
	  echo $ip > /usr/thisismyname
	  cat /usr/thisismyname
	fi
fi

printf "${BBLUE}"
printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
/usr/local/bin/echo_name.sh SSH SERVER START
###################################################################
printf "${BLUE}"
if [[ $(cat /volume2/docker_final/setup_new/server_start) != "no" ]];then
  echo
  printf "${YELLOW}"
  echo "SSH SERVER STARTEN? (y/n)" 
  read -n 1 server
	if [[ $server = "y" ]];then
	  service ssh start
	  echo
	  printf "${RED}"
	  echo "IP:"
	  ip a
	  echo $(myip.sh) > ~/.config/$(myname.sh)
	  echo $(ip a) >> ~/.config/$(myname.sh)
	  printf "${RED}BUTTON ${BLUE}" 10
	  read -t 10 me
	fi
fi

#=====================================================================================================
echo
printf "${RED}BUTTON ${BBLUE}"; read -t 2 me
###################################################################
/usr/local/bin/echo_name.sh APT autoremove
###################################################################
printf "${BLUE}"
apt -y autoremove
echo
echo zsh-autosuggestions
printf "${BLUE}"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo printf "${BBLUE}"
echo /zsh-syntax-highlighting
printf "${BLUE}"
echo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
printf "${BBLUE}"
echo /powerlevel10k
printf "${BLUE}"
echo
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
printf "${BBLUE}"
echo /zprezto
printf "${BLUE}"
echo
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
printf "${BBLUE}"
echo "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
chsh -s /bin/zsh
#echo zinit
printf "${BLUE}"
echo
#sh -c "$(curl -fsSL https://git.io/zinit-install)"
printf "${BLUE}"

rm /volume2/docker_final/setup_new/server_install
rm /volume2/docker_final/setup_new/server_start

printf "${BBLUE}"
echo 'echo source ~/powerlevel10k/powerlevel10k.zsh-theme >>~/.zshrc'
printf "${BLUE}"
echo
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
echo
printf "${BBLUE}"

printf "${BBLUE}"
echo "rclone copy sec:dotfiles /root -P"
printf "${BLUE}"
rclone copy sec:dotfiles /root -P
rclone copy gdsec:root/powerlevel10k /root/powerlevel10k -P
echo RESTART ZSH
printf "${BLUE}"
echo
source /root/.bashrc
source zas
exec zsh
#rm /volume1/sec/rc

#rclone copy snas:sec/config ~/.config/ -P
#cp /volume1/sec/config/rclone/rclone.conf ~/.config/rclone/
#cp ~/.config/.bashrc ~/
#cp /volume1/sec/config/.bashrc ~/.bashrc
#rclone copy utils: /volume2/docker/utils/ -P
#source ~/.bashrc
#pathcopy.sh
#enter.sh
