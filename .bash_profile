if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]$(parse_git_branch " (%s)") \$ '
#export PS1='\n\[\e[1;37m\]|-- \[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(parse_git_branch " (%s)")\[\e[0;39m\] \[\e[1;37m\]--|\[\e[0;39m\]\n\$ '
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

if [ -f `brew --prefix`/etc/bash_completion ]; then 
    . `brew --prefix`/etc/bash_completion
fi

# if Docker completion isn't working, see: https://stackoverflow.com/questions/26132451/how-to-add-bash-command-completion-for-docker-on-mac-os-x

export PATH=~/.npm-global/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
