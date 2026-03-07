#!/usr/bin/env bash
# Nightfox colors for Tmux
# Style: dayfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/dayfox/dayfox.tmux

# ==========================
# Override theme settings
# ==========================
set -g mode-style "fg=#f6f2ee,bg=#2848a9"
set -g message-style "fg=#f6f2ee,bg=#643f61"
set -g message-command-style "fg=#f6f2ee,bg=#643f61"
set -g pane-border-style "fg=#643f61"
set -g pane-active-border-style "fg=#2848a9"
set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#643f61,bg=#f6f2ee"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
set -g status-left "#[fg=#f6f2ee,bg=#6e33ce,bold] #S #[fg=#6e33ce,bg=#f6f2ee,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#2848a9,bg=#f6f2ee,nobold,nounderscore,noitalics]#[fg=#f6f2ee,bg=#2848a9,bold] #{b:pane_current_path} "
setw -g window-status-activity-style "underscore,fg=#824d5b,bg=#f6f2ee"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#824d5b,bg=#f6f2ee"
setw -g window-status-format "#[fg=#f6f2ee,bg=#f6f2ee,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#f6f2ee,bg=#f6f2ee,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#f6f2ee,bg=#643f61,nobold,nounderscore,noitalics]#[fg=#f6f2ee,bg=#643f61,bold] #I  #W #[fg=#643f61,bg=#f6f2ee,nobold,nounderscore,noitalics]"