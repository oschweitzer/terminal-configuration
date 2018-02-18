# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export ZSH_THEME="xiong-chiamiov-plus"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker node python sudo npm zsh-autosuggestions docker-compose)

source $ZSH/oh-my-zsh.sh

alias docker-portainer='docker run --restart=always -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer --no-auth'
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-delete-all-containers='docker rm $(docker ps -a -q)'
alias docker-delete-all-images='docker rmi $(docker images -q)'
alias docker-delete-untagged-images='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias docker-delete-all-containers-force='docker rm -f $(docker ps -a -q)'
alias docker-delete-all-images-force='docker rmi -f $(docker images -q)'

# text normal colors
red='\e[0;31m'
blue='\e[0;34m'
cyan='\e[0;36m'
green='\e[0;32m'
yellow='\e[0;33m'

# text bright colors
bred='\e[0;91m'
bblue='\e[0;94m'
bcyan='\e[0;96m'
bgreen='\e[0;92m'
byellow='\e[0;93m'
bwhite='\e[0;97m'

# reset color
NC='\e[0m'

########################################################################
## options #############################################################
########################################################################

# misc -----------------------------------------------------------------
# no beep
unsetopt beep
unsetopt hist_beep
unsetopt list_beep
# confirm 'rm *'
unsetopt rm_star_silent
# no error on search 
setopt nullglob
# complétion menu
setopt auto_menu
# don't &proc kill on exit
setopt auto_continue
# don’t nice &proc
setopt no_bg_nice

# keys -----------------------------------------------------------------
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# history --------------------------------------------------------------
# history size
HISTSIZE=5000
SAVEHIST=5000
# history file
HISTFILE=~/.zsh_history
# history without double entry
setopt hist_ignore_all_dups
# all zsh instance share same file
setopt share_history
# update history
setopt inc_append_history

########################################################################
## aliases #############################################################
########################################################################

# ls & grep ------------------------------------------------------------

export GREP_COLOR='00;38;5;226'
export GREP_COLORS='fn=1;34'

alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -al'
alias cl='clear'

# cd & goto ------------------------------------------------------------
alias cd..='cd ..'
alias ...='cd ..'
alias ....='cd ../..'
alias gm='cd /media'
alias gc='cd ~/.config'
alias gb='cd ~/bin'
alias gp='cd ~/pkgs'
alias gg='cd ~/arpinux_git'

########################################################################
## file type ###########################################################
########################################################################
alias -s html=$BROWSER
alias -s pdf=epdfview
alias -s svg=inkscape
alias -s png=eyez
alias -s jpg=eyez
alias -s gif=eyez
alias -s txt=$EDITOR
alias -s conf=$EDITOR
alias -s py=$EDITOR
alias -s php=$EDITOR
alias -s mp3=mplayer
alias -s ogg=mplayer
alias -s ogv=mplayer
alias -s flv=mplayer
alias -s avi=mplayer
alias -s mp4=mplayer
alias -s mkv=mplayer
alias -s m3u=mocp
alias -s zip=dtrx
alias -s tar=dtrx
alias -s tar.gz=dtrx
alias -s tar.bz2=dtrx
alias -s xz=dtrx
alias -s rar=dtrx