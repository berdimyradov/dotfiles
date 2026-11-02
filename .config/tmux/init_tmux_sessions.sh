#!/usr/bin/env bash
set -u

create_session() {
  local name="$1" dir="$2"
  if ! tmux has-session -t "$name" 2>/dev/null; then
    tmux new-session -d -s "$name" -c "$dir"
    return 0
  fi
  return 1
}

add_window() {
  tmux new-window -t "$1" -n "$2" -c "$3"
}

add_command_window() {
  add_window "$1" "$2" "$3"
  tmux send-keys -t "$1:$2" "$4" Enter
}

add_run_window() {
  local name="$1" dir="$2"
  tmux rename-window -t "$name:1" run
  tmux split-window -h -t "$name:1" -c "$dir"
}

# config
if create_session 01-config "$HOME/.config"; then
  tmux rename-window -t 01-config:1 nvim
  add_window 01-config git "$HOME/.config"
  add_window 01-config agent "$HOME/.config"
fi

# berdimyradov.com
if create_session 02-berdimyradov.com "$HOME/repos/berdimyradov.com"; then
  add_run_window 02-berdimyradov.com "$HOME/repos/berdimyradov.com"
  add_command_window 02-berdimyradov.com nvim "$HOME/repos/berdimyradov.com" nvim
  add_command_window 02-berdimyradov.com git "$HOME/repos/berdimyradov.com" lazygit
  add_command_window 02-berdimyradov.com review "$HOME/repos/berdimyradov.com" tuicr
  add_command_window 02-berdimyradov.com yazi "$HOME/repos/berdimyradov.com" yazi
fi

# obsidian
if create_session 03-obsidian /Users/berdimyradov/repos/obsidian-vault; then
  add_command_window 03-obsidian nvim /Users/berdimyradov/repos/obsidian-vault nvim
  add_command_window 03-obsidian git /Users/berdimyradov/repos/obsidian-vault lazygit
  add_window 03-obsidian misc /Users/berdimyradov/repos/obsidian-vault
  add_window 03-obsidian notes /Users/berdimyradov/repos/obsidian-vault
fi

# jobpilot
if create_session 04-jobpilot /Users/berdimyradov/repos/job-pilot; then
  add_run_window 04-jobpilot /Users/berdimyradov/repos/job-pilot
  add_command_window 04-jobpilot nvim /Users/berdimyradov/repos/job-pilot nvim
  add_command_window 04-jobpilot git /Users/berdimyradov/repos/job-pilot lazygit
  add_command_window 04-jobpilot review /Users/berdimyradov/repos/job-pilot tuicr
  add_command_window 04-jobpilot agent /Users/berdimyradov/repos/job-pilot pi
  add_command_window 04-jobpilot lsql /Users/berdimyradov/repos/job-pilot lazysql
  add_command_window 04-jobpilot ldocker /Users/berdimyradov/repos/job-pilot lazydocker
fi

# badalga
if create_session 05-badalga "$HOME/repos/badalga"; then
  add_run_window 05-badalga "$HOME/repos/badalga"
  add_command_window 05-badalga nvim "$HOME/repos/badalga" nvim
  add_command_window 05-badalga git "$HOME/repos/badalga" lazygit
  add_command_window 05-badalga review "$HOME/repos/badalga" tuicr
  add_command_window 05-badalga agent "$HOME/repos/badalga" pi
  add_command_window 05-badalga lsql "$HOME/repos/badalga" lazysql
  add_command_window 05-badalga ldocker "$HOME/repos/badalga" lazydocker
fi

# misc
if create_session 99-misc "$HOME"; then
  tmux rename-window -t 99-misc:1 misc
fi

echo "Tmux sessions initialized!"
