set -g default-terminal "xterm-256color"

set -g escape-time 0
set -g status-utf8 on
set -g status-interval 20
set -g history-limit 10000
set -g base-index 1
setw -g aggressive-resize on
setw -g monitor-activity off
set -g visual-activity off
set -g mode-keys vi

# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# Saner splitting.
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %
set -g repeat-time 100

# Easy config reload
bind r source-file ~/.tmux.conf \; display "Reloaded Config"

# Status line configuration
set-window-option -g window-status-current-bg yellow

set -g status-left-length 20
set -g status-bg colour235
set -g status-fg colour231
set -g status-left "#{?client_prefix,#[fg=colour235]#[bg=colour142]#[nobold],#[fg=colour235]#[bg=colour231]#[nobold]} #S #{?client_prefix,#[fg=colour142]#[bg=colour235]#[nobold],#[fg=colour231]#[bg=colour235]#[nobold]}"
set -g status-right "#[fg=colour249,bg=colour235] %Y-%m-%d #[fg=colour240]#[fg=colour249] #(TZ=America/New_York date +%%H:%%M) #[fg=colour142]#[bg=colour235]#[fg=colour235,bg=colour142] #h "
setw -g window-status-current-format "#[fg=colour235,bg=colour142]#[fg=colour235,bg=colour142] #I  #[fg=colour235]#W #[fg=colour142,bg=colour235]"
setw -g window-status-format "#[fg=colour249,bg=colour235]#I #[fg=colour240] #[fg=colour249,bg=colour235]#W "

# Automatically renumber windows when one is closed
set-option -g renumber-windows on

if-shell "test -f ~/.tmux.conf.local" "source ~/.tmux.conf.local"

