#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"



### I ADDED THIS ###
export VISUAL="nano"

### Set alias
#############

alias ll="ls -la"
alias ls="ls --color=auto "
alias l="ls"
alias la="ls -a"
alias sf="screenfetch"
alias c="clear"
alias x="exit"
alias cls="clear"
alias off="shutdown -h now"
alias rut="sudo su"
alias root="sudo su"
alias leaf="leafpad"
alias snan="sudo nano"
alias ..="cd .."
alias ...="cd ../cd .."

######ARCH LINUX#######< 
alias pac="sudo pacman"
alias pacs="sudo pacman -S"
alias yrts="yaourt -S"
alias yrt="yaourt"
alias inst="sudo pacman -S"
alias upd="sudo pacman -Sy
                yaourt -Sy"
alias upg="sudo pacman -Syu
                yaourt -Syu"
alias grb="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias del="sudo pacman -Rs"

#####DEBIAN/UBUNTU####
# alias upg="sudo apt-get upgrade"
# alias sup="sudo apt-get upgrade"
# alias upd="sudo apt-get update"
# alias inst="sudo apt install"
# alias sinstall="sudo apt-get install"
# alias grb="sudo update-grub"
# alias aplist="apt list --upgradable"
# alias arm="sudo apt autoremove"
# alias del="sudo apt-get remove"

## warning this next option removes all config files as well.
# alias del="sudo apt-get purge"




