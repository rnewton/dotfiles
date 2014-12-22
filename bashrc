# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

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
# General
################
alias brc="nano ~/.bashrc; source ~/.bashrc"
alias ls="ls -lahp --color=auto"
alias less="less -S"
alias cls="ls -l | awk   '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
alias qfind="find . -name "
alias df="df -h"

################
# SSH & Other System specific stuff
################

if [ -f ~/.bash_ssh ]; then 
	. ~/.bash_ssh
fi

if [ -f ~/.bash_db ]; then 
	. ~/.bash_db
fi
