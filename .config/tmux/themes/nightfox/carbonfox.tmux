#!/usr/bin/env bash
# Nightfox colors for Tmux
# Style: carbonfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/carbonfox.tmux

# ==========================
# Override theme settings
# ==========================
set -g mode-style "fg=#161616,bg=#33b1ff"
set -g message-style "fg=#161616,bg=#b6b8bb"
set -g message-command-style "fg=#161616,bg=#b6b8bb"
set -g pane-border-style "fg=#b6b8bb"
set -g pane-active-border-style "fg=#33b1ff"
set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#b6b8bb,bg=#161616"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
set -g status-left "#[fg=#161616,bg=#be95ff,bold] #S #[fg=#be95ff,bg=#161616,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#33b1ff,bg=#161616,nobold,nounderscore,noitalics]#[fg=#161616,bg=#33b1ff,bold] #{b:pane_current_path} "
setw -g window-status-activity-style "underscore,fg=#7b7c7e,bg=#161616"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#7b7c7e,bg=#161616"
setw -g window-status-format "#[fg=#161616,bg=#161616,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#161616,bg=#161616,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#161616,bg=#b6b8bb,nobold,nounderscore,noitalics]#[fg=#161616,bg=#b6b8bb,bold] #I  #W #[fg=#b6b8bb,bg=#161616,nobold,nounderscore,noitalics]"
