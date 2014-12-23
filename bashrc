################
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
################
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi


################
# Source global definitions
################
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


################
# Setup Environment
################
export PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;33m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\t\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export EDITOR=/bin/nano


################
# TODO List
################
if [ -f ~/bin/todo.sh ]; then 
	export TODOTXT_DEFAULT_ACTION=ls
	source ~/.todo/todo_completion

	alias t="~/bin/todo.sh"

	#complete -F _todo t
fi


################
# Aliases
################
alias ls="ls -lahp --color=auto"
alias less="less -S"
alias cls="ls -l | awk   '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
alias qfind="find . -name "
alias df="df -h"
alias nano="nano -w"


################
# Functions
################

# Swap two filenames
function swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# Repeat a command
function repeat() # repeat n-times command
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do
        eval "$@";
    done
}


################
# Local system
################

if [ -f ~/.bash_local ]; then
	. ~/.bash_local
fi

if [ -f ~/.bash_ssh ]; then 
	. ~/.bash_ssh
fi

if [ -f ~/.bash_db ]; then 
	. ~/.bash_db
fi
