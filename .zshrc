# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
ip=$(hostname)
if [[ "$ip" = "LAPTOP-HR2FJQGL" ]]; then
  mkdir /mnt/t
  mkdir /volume1
  mkdir /volume2
  mkdir /volume2/cloudhq
  mount -t drvfs T: /mnt/t
  mount -t drvfs T: /volume2
  mount -t drvfs T: /volume1  
  sudo mount -t nfs 192.168.86.29:volume2/cloudhq /volume2/cloudhq -o nolock
  sudo mount -t nfs 192.168.86.29:volume2/docker /volume2/docker -o nolock
  sudo mount -t nfs 192.168.86.29:volume2/downloads2 /volume2/downloads2 -o nolock
  sudo mount -t nfs 192.168.86.29:volume1/sec /volume1/sec -o nolock
fi
export PATH=$HOME/bin:/usr/local/bin:$PATH
source ~/bin/path.dat
#export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"
#source ~/bin/zsh_plugins.dat
#source $ZSH/oh-my-zsh.sh
source ~/bin/alias.dat

#source ~/powerlevel10k/powerlevel10k.zsh-theme
#To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export TERM=xterm-256color


# This is just for git commits - you should always use emacs!!!
export VISUAL=nano
export EDITOR="$VISUAL"

# Some useful aliases
alias ze="$EDITOR ~/.zshrc"
alias zs="source ~/.zshrc"

# Path to your oh-my-zsh install
export ZSH="$HOME/.oh-my-zsh"

# Big cheese!! 🧀!! We're going to install a zsh package manager!

# Using the nightly, with:
# curl -L git.io/antigen-nightly > antigen.zsh
source ~/antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

# zsh has a ton of nice builtins!
# here just my favs (I haven't even seen them all)
antigen bundle git # autocompletions
antigen bundle pip # autocompletions

# A bit more exciting 😎
antigen bundle command-not-found # suggests commands
antigen bundle z # jump around!
antigen bundle colored-man-pages # Neat man pages bro

# zsh-users bundles (an awesome group of devs 🙏)
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions # Game changer!

antigen bundle magic-enter 
antigen bundle copypath 
antigen bundle safe-paste 
antigen bundle tmux 
antigen bundle fzf 
antigen bundle copypath 
antigen bundle cp 
antigen bundle copybuffer



# Shhh secret 🤫 bundles
antigen bundle thefuck # 🙃

# ESSENTIAL
antigen bundle SinaKhalili/sina
antigen bundle SinaKhalili/ignore-dollarsign

# Experimental zone
antigen bundle desyncr/auto-ls 
antigen bundle andrewferrier/fzf-z 

# Cool gitignore creation module
antigen bundle voronkovich/gitignore.plugin.zsh 
# Nicer git diffing
antigen bundle zdharma/zsh-diff-so-fancy

# Let's add a theme! 
antigen theme romkatv/powerlevel10k
source .p10k.zsh

# Always remember to antigen apply!! 🤗🤗
antigen apply

# Secret environments
source ~/.zshrc.env
