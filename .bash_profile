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
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 

#alias setwork='git config.name "Vartan Benohanian" && git config.email VBenohanian@egravity.io"'

# bash_profile aliases because it's annoying to type
alias v='vi ~/.bash_profile'
alias src='source ~/.bash_profile'

# git aliases
alias url='git config --get remote.origin.url'
alias stats='git diff --shortstat'
alias mp='git checkout master && git pull'
alias mpd='git checkout master && git pull && git branch -d $(git rev-parse --abbrev-ref @{-1})'
alias undo='git reset HEAD~1 --soft'
alias o='open_repo_in_browser'

open_repo_in_browser() {
    url=$(url)
    if [ ! -z $url ];
    then
        # Cloned with SSH
        if [[ $url == "git@github"*".com:"* ]];
        then
            url=https://github.com/${url#*:}
        fi
        open -a "Google Chrome" $url;
    else
        echo "Not a git repo."
    fi
}

lg() {
	if [ ! -z $1 ];
	then
		git log -n $1
	else
		git log
	fi
}

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
alias syspr='docker system prune -f'

# capstone aliases
alias pg='docker container run -itd  --name capstonedb -e POSTGRES_PASSWORD=scheduler -e POSTGRES_USER=scheduler -e POSTGRES_DB=scheduler -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres:11 && sleep 3 && (cap && cd server/dist/db && knex migrate:latest && knex seed:run)'
alias rmpg='docker container rm -f capstonedb; docker volume rm pgdata'
alias rmpgpg='rmpg && pg'
alias rmpgd='docker volume rm pgdata'
alias cap='cd ~/Desktop/Courses/SOEN\ 490\ \(Capstone\)/AppointmentScheduler'
alias run='cd "/Users/vartanbeno/Desktop/Courses/SOEN 490 (Capstone)/AppointmentScheduler/client" && npm run serve:unix'
alias rmimg='docker image rmi appointment-scheduler-client appointment-scheduler-server'
alias crm='(cap && c down && imgpr && rmimg && rmpgd)'
alias ts='tsc && nodemon dist/app.js'
alias t='rmpg; tsc && pg'
alias tn='t && nodemon dist/app.js'

# COMP 479 final project aliases
alias cr='(cd /Users/vartanbeno/PycharmProjects/sentiment-web-crawler && docker image build -t crawler . && docker container run -it --rm --name crawler-demo crawler)'
alias crv='(cd /Users/vartanbeno/PycharmProjects/sentiment-web-crawler && docker image build -t crawler . && docker container run -it --rm -v "$(pwd)/src":"/usr/src/app" --name crawler-demo crawler)'

crawl() {

    if [ -z $1 ]
    then
        command="python main.py"
    else
        command="python main.py --start-url "$1""
    fi

	docker container run -it --rm crawler $command

}

# Get MyConcordia grades
alias grades='(cd ~/PycharmProjects/concordia-grades && docker container run -it --rm --name grades grades)'

# IDE
alias idea='/usr/local/bin/idea'
alias py='/usr/local/bin/charm'

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

if [ -f `brew --prefix`/etc/bash_completion ]; then 
    . `brew --prefix`/etc/bash_completion
fi

# if Docker completion isn't working, see: https://stackoverflow.com/questions/26132451/how-to-add-bash-command-completion-for-docker-on-mac-os-x

