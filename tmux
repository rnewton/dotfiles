# Ring the bell if any background window rang a bell
set -g bell-action any

# Default termtype. If the rcfile sets $TERM, that overrides this value.
set -g default-terminal screen-256color

# color scheme (styled as vim-powerline)
set -g status-left-length 52
set -g status-right-length 451
set -g status-fg white
set -g status-bg colour234
set -g pane-border-fg colour245
set -g pane-active-border-fg colour39
set -g message-fg colour16
set -g message-bg colour221
set -g message-attr bold
set -g status-left '#[fg=colour235,bg=colour252,bold] #S #[fg=colour252,bg=colour238,nobold]⮀#[fg=colour245,bg=colour238,bold] #(whoami) #[fg=colour238,bg=colour234,nobold]⮀'
set -g window-status-format "#[fg=colour235,bg=colour252,bold] #I #W "
set -g window-status-current-format "#[fg=colour234,bg=colour39]⮀#[fg=black,bg=colour39,noreverse,bold] #I: #W #[fg=colour39,bg=colour234,nobold]⮀"

# Bigger history
set -g history-limit 10000

# New windows/pane in $PWD
bind c new-window -c "#{pane_current_path}"
