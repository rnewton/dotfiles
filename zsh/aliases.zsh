# General
alias qfind="find . -name "
alias df="df -h"
alias nano="nano -w"
alias grep="grep --color"
alias composer="composer.phar"

# Git
alias gr='[ ! -z `git rev-parse --show-toplevel` ] && cd `git rev-parse --show-toplevel || pwd`'
alias gb='git branch'
alias gdc='git diff --cached'
alias gd='git diff'
alias gap='git add -p'
alias ga='git add'
alias gc='git commit --verbose'
alias gca='git amend'
alias gco='git checkout'
alias gl='git log'
alias gs='git status'
alias gsp='git show -p'
alias gp='git pull'
alias gpr='git rebase'
alias gP='git push'
alias gm='git merge'
alias g='git'
alias gg='git grep'

# Local overrides
[ -e ~/.zsh.local/aliases.zsh ] && . ~/.zsh.local/aliases.zsh || true
