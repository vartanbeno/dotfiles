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
alias l='ls -ltr'
alias ll='ls -ltr'
alias rm='rm -i'
alias cl='clear'
alias grep='grep --color=auto'
alias u='uptime'
alias odin='cd ~/the_odin_project'
alias android='cd ~/Android'
alias python='python3'
alias vh='cd ~/git/angular/ViewHub'
alias p='mdls -name kMDItemNumberOfPages'

# bash_profile aliases because it's annoying to type
alias v='vi ~/.bash_profile'
alias src='source ~/.bash_profile'

# git aliases
alias url='git config --get remote.origin.url'
alias stats='git diff --shortstat'
alias mp='git checkout master && git pull'
alias mpd='git checkout master && git pull && git branch -d $(git rev-parse --abbrev-ref @{-1})'
alias o='if [ ! -z $(echo `git config --get remote.origin.url`) ]; then open -a "Google Chrome" $(echo `git config --get remote.origin.url`); else echo "Not a git repo."; fi'

new_branch() {
    git checkout -b $1
    git push -u origin $1
}

rename_branch() {
    old=$(git rev-parse --abbrev-ref HEAD)
    if [ $old == "master" ]
    then
        echo "You are on master."
    else
        git branch -m $1
        git push origin :$old $1
        git push origin -u $1
    fi
}

# docker aliases
alias img='docker images'
alias con='docker container ls -a'
alias net='docker network ls'
alias vol='docker volume ls'
alias c='docker-compose'
alias imgpr='docker image prune -f'
alias conpr='docker container prune -f'
alias netpr='docker network prune -f'
alias volpr='docker volume prune -f'

# capstone aliases
alias pg='docker container run -itd  --name capstonedb -e POSTGRES_PASSWORD=scheduler -e POSTGRES_USER=scheduler -e POSTGRES_DB=scheduler -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres:11 && sleep 2 && (cap && cd server/dist/db && knex migrate:latest && knex seed:run)'
alias rmpg='docker container rm -f capstonedb && docker volume rm pgdata'
alias rmpgd='docker volume rm pgdata'
alias cap='cd ~/Desktop/Courses/SOEN\ 490\ \(Capstone\)/AppointmentScheduler'
alias run='cd "/Users/vartanbeno/Desktop/Courses/SOEN 490 (Capstone)/AppointmentScheduler/client" && npm run serve:unix'
alias rmimg='docker image rmi appointment-scheduler-client appointment-scheduler-server'
alias crm='(cap && c down && imgpr && rmimg && rmpgd)'

# IDE
alias idea='/usr/local/bin/idea'
alias py='/usr/local/bin/charm'

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

