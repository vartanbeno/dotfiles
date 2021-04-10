alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'
alias .8='cd ../../../../../../../..'
alias .9='cd ../../../../../../../../..'
alias l='ls -lthr'
alias ll='ls -lathr'
alias rm='rm -i'
alias cl='clear'
alias grep='grep --color=always'
alias u='uptime'
alias python='python3'
alias pip='pip3'
# currently using for postgres container
#alias p='mdls -name kMDItemNumberOfPages'
alias docs='cd ~/Documents'
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 
alias hi='ssh vartanbeno@10.0.0.34'
alias letmein='ssh -p 22001 vartanbeno@vartanbeno.com'

# First is public IP, second is local
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias myip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# dotfile aliases because they're annoying to type
alias v='vi ~/.bash_aliases'
alias vf='vi ~/.bash_functions'
alias vp='vi ~/.bash_profile'
alias src='source ~/.bashrc'

# Git
alias url='git config --get remote.origin.url'
alias stats='git diff --shortstat'
alias statss='git diff --staged --shortstat'
alias mp='git checkout master && git pull'
alias mpd='git checkout master && git pull && git branch -d $(git rev-parse --abbrev-ref @{-1})'
alias dpd='git checkout develop && git pull && git branch -d $(git rev-parse --abbrev-ref @{-1})'
alias undo='git reset HEAD~1 --soft'
alias o='open_repo_in_browser'
alias g='cat ~/.gitconfig'
alias vg='vi ~/.gitconfig'
alias gits='git status'
alias gitb='git branch'

# Docker
alias img='docker image ls -a'
alias con='docker container ls -a'
alias net='docker network ls'
alias vol='docker volume ls'
alias c='docker-compose'
alias imgpr='docker image prune -f'
alias conpr='docker container prune -f'
alias netpr='docker network prune -f'
alias volpr='docker volume prune -f'
alias syspr='docker system prune -f --volumes'

# IDE
alias idea='/usr/local/bin/idea'
alias py='/usr/local/bin/charm'

# Connecting AirPods, make sure to use the MAC address of your pair
# Uses bluetoothconnector package, install with Homebrew by running: brew install bluetoothconnector
alias air='BluetoothConnector 40-70-F5-EA-4D-CD --notify'
