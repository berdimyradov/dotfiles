#!/bin/bash

# Function to create a session if it doesn't exist
create_session() {
  session_name=$1
  start_dir=$2
  tmux has-session -t "$session_name" 2>/dev/null
  if [ $? != 0 ]; then
    tmux new-session -d -s "$session_name" -c "$start_dir"
    return 0 # New session created
  fi
  return 1 # Session already exists
}

# --- 1. MISC ---
if create_session "misc" "$HOME"; then
  tmux new-window -t "misc" -c "$HOME"
  tmux new-window -t "misc" -n "obsidian" -c "$HOME/my-projects/obsidian-vault"
fi

# --- 2. CONFIG ---
if create_session "config" "$HOME/.config"; then
  tmux new-window -t "config" -n "shell" -c "$HOME/shell"
  tmux new-window -t "config" -c "$HOME"
  tmux new-window -t "config" -c "$HOME"
fi

# --- 3. BERDIMYRADOV ---
if create_session "berdimyradov" "$HOME/my-projects"; then
  tmux new-window -t "berdimyradov" -n "main" -c "$HOME/my-projects/berdimyradov"
  tmux new-window -t "berdimyradov" -n "site" -c "$HOME/my-projects/berdimyradov.com"
fi

# --- 4. FINLOFT ---
if create_session "finloft" "$HOME/work/finloft"; then
  # Window 1: Dev Services (2 panes)
  tmux rename-window -t "finloft:1" "services"
  tmux split-window -v -t "finloft:1" -c "$HOME/work/finloft"

  # Send commands to the specific panes
  tmux send-keys -t "finloft:1.1" "pnpm -F @finloft/mobile start:dev"  # Top pane
  tmux send-keys -t "finloft:1.2" "pnpm -F @finloft/backend start:dev" # Bottom pane

  # Window 2: Git
  tmux new-window -t "finloft" -n "git" -c "$HOME/work/finloft"
  tmux send-keys -t "finloft:2" "lazygit" Enter

  # Window 3 & 4: Claude Code
  tmux new-window -t "finloft" -n "claude-1" -c "$HOME/work/finloft"
  tmux new-window -t "finloft" -n "claude-2" -c "$HOME/work/finloft"

  # Window 5: Misc
  tmux new-window -t "finloft" -n "misc" -c "$HOME/work/finloft"
fi

# --- 5. WORK ---
if create_session "work" "$HOME/work"; then
  tmux new-window -t "work" -c "$HOME/work"
fi

echo "Tmux sessions initialized!"
