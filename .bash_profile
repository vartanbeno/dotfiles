if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

if [ -f `brew --prefix`/etc/bash_completion ]; then 
    . `brew --prefix`/etc/bash_completion
fi

# if Docker completion isn't working, see: https://stackoverflow.com/questions/26132451/how-to-add-bash-command-completion-for-docker-on-mac-os-x

export PATH=~/.npm-global/bin:$PATH
