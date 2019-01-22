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

createpg() {
    docker container run -d --name $1 -e POSTGRES_USER=$2 -e POSTGRES_PASSWORD=$3 -e POSTGRES_DB=$4 -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres:11
}
