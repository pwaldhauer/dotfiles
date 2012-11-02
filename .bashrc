#only execute in interactive mode
[ -z "$PS1" ] && return

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

alias qq='cd /var/www/quotefm'
alias qqa='cd /var/www/quotefm/protected/modules/api'

# exports
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export EDITOR="vim"

# prompt
GITBRANCH=`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`

export PS1="\[\033[1;34m\]\t \[\033[0;31m\]\u\[\033[0m\]@\[\033[32m\]\H \[\033[1;32m\]\w$GITBRANCH \[\033[1;37m\]# \[\033[0m\] "
