#only execute in interactive mode
[ -z "$PS1" ] && return


function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function backup_photos {
    rsync --exclude "Lightroom 5 Catalog Previews*" -aPr /Users/pwaldhauer/Pictures/Raw/ /Volumes/Data/Fotos/2014
}

export PROJECT_DIRECTORY="/Users/pwaldhauer/Dropbox/dev/Tests/"

function spawn_project {
    if [ -z $2 ]
    then
        echo "You need a project name!"
        return
    fi

    if [ $1 = "node" ]
    then
        spawn_project_node $2
    else
        echo "Invalid environment, please use one of those: node"
    fi
}

function spawn_project_node {
    PROJECT_NAME=$1;
    echo "Creating project $PROJECT_NAME in $PROJECT_DIRECTORY"
    cd $PROJECT_DIRECTORY
    mkdir $PROJECT_NAME
    cd $PROJECT_NAME

    cat << WOWSUCHTEXTVERYPLAIN > package.json
{
    "name": "$PROJECT_NAME",
    "version": "0.0.0",
    "description": "",
    "main": "app.js",
    "dependencies": {
        "underscore": "x.x",
        "async": "x.x"
    },
    "author": "Philipp Waldhauer",
    "license": "MIT"
}
WOWSUCHTEXTVERYPLAIN

    cat << WOWSUCHTEXTVERYPLAIN > README.md
# $PROJECT_NAME

Please write a meaningful readme.
WOWSUCHTEXTVERYPLAIN

    cat << WOWSUCHTEXTVERYPLAIN > app.js
var _ = require('underscore');
var async = require('async');

WOWSUCHTEXTVERYPLAIN

    cat << WOWSUCHTEXTVERYPLAIN > .gitignore
node_modules
.DS_Store
._.DS_Store
WOWSUCHTEXTVERYPLAIN

    npm install
    git init
    git add .
    git commit -am "Initial commit"

    subl .

}

alias spn=spawn_project_node

# prompt
export PS1="\[\033[1;34m\]\t \[\033[0;31m\]\u\[\033[0m\]@\[\033[32m\]\H \[\033[1;32m\]\w\$(parse_git_branch) \[\033[1;37m\]# \[\033[0m\] "

shopt -s cdspell
shopt -s checkwinsize

# aliases: general
alias dir='ls -lisah'
alias ll='ls -lisah'

alias ..='cd ..'
alias cd..='cd ..'
alias o.o='ls -lisah --color=auto'
alias grep='grep --color=auto'

# aliases: qfm/git
alias push='git push origin --all'
alias ga='git add'
alias gs='git status'

alias halt='echo Nein, Idiot'

alias wow='git status'
alias such='git'

alias sshconfig='subl ~/.ssh/config'
alias irc='ssh -t buffy "screen -r irssi"'


# aliases: awesome
alias please='sudo'

# exports
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export EDITOR="vim"

