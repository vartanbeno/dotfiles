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

lgo() {
    if [ ! -z $1 ];
    then
        git log --oneline -n $1
    else
        git log --oneline
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

mkpg() {
    docker container run -d --name $1 -e POSTGRES_USER=$1 -e POSTGRES_PASSWORD=$1 -e POSTGRES_DB=$1 -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres:11
}

clone() {
    git clone "$1" && cd "$(basename "$1" .git)"
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

copy() {
    cat "${1}" | pbcopy
}

findit() {
    grep -E "$2|$" $1
}

finditi() {
    grep -iE "$2|$" $1
}

doit() {
    for i in $(eval echo {1..$1}); do eval ${@:2}; done
}

doitp() {
    for i in $(eval echo {1..$1}); do echo -n "$i: "; eval ${@:2}; done
}
