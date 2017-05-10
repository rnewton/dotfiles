################
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
################
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi


###############
# TMUX
###############
if command -v tmux > /dev/null; then
	[[ ! $TERM =~ screen ]] && [[ -z $TMUX ]] && exec tmux
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
powerline_path=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename' 2> /dev/null)
if [[ "$powerline_path" != "" ]]; then 
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	source ${powerline_path}/bindings/bash/powerline.sh
else
	export PS1="\n\[$(tput bold)\]\[$(tput setab 1)\]\u \[$(tput setab 4)\]\[$(tput setaf 1)\]▶\[$(tput setaf 7)\] \h \[$(tput setab 5)\]\[$(tput setaf 4)\]▶\[$(tput setaf 7)\] \W \[$(tput sgr0)\]\n\`if [ \$? != 0 ]; then echo \?!; fi\`\\$ "
fi

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export EDITOR=nano

platform=$(uname)

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
alias brc="nano ~/.bashrc; source ~/.bashrc"
alias less="less -S"
alias cls="ls -l | awk   '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
alias qfind="find . -name "
alias df="df -h"
alias nano="nano -w"
alias grep="grep --color"

if [[ $platform == 'Linux' ]]; then 
	alias ls="ls -lahp --color=auto"
else
	alias ls="ls -lahpG"
fi


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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
