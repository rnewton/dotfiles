export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TERM=xterm-256color

source ~/.xinitrc 2> /dev/null

[ -e "$HOME/golang" ] && export GOPATH="$HOME/golang"
[ -e "/usr/local/go" ] && export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# Local overrides
[ -e ~/.zsh.local/environment.zsh ] && . ~/.zsh.local/environment.zsh || true
