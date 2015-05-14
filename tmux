# Ring the bell if any background window rang a bell
set -g bell-action any

# Bigger history
set -g history-limit 10000

# status bar on top
set-option -g status-position top

# powerline
source "${powerline_path}/bindings/tmux/powerline.conf"
