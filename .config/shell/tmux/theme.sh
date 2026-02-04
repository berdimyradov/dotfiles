#!/usr/bin/env bash
set -euo pipefail

# This script changes the tmux theme flavor (e.g., catppuccin) by updating
# a configuration file and reloading tmux. It is used by terminal.sh to
# sync tmux with the system/terminal theme (light/dark).

FLAVOR="${1:-}"

if [[ -z "$FLAVOR" ]]; then
  echo "Usage: $0 <flavor> (e.g. latte, frappe, macchiato, mocha)"
  exit 1
fi

THEME_FILE="$HOME/.config/tmux/theme_flavor.conf"

# Write the config to set the catppuccin flavor
cat > "$THEME_FILE" <<EOF
set -g @catppuccin_flavor '${FLAVOR}'
EOF

# Reload tmux config if server is running
if pgrep -x "tmux" > /dev/null; then
  # Source the variable setting
  tmux source-file "$THEME_FILE"
  
  # Try to reload the main config to apply the theme change (if tpm is used)
  # Try common locations
  if [ -f "$HOME/.tmux.conf" ]; then
    tmux source-file "$HOME/.tmux.conf"
  elif [ -f "$HOME/.config/tmux/tmux.conf" ]; then
    tmux source-file "$HOME/.config/tmux/tmux.conf"
  fi
fi

echo "🪟 Tmux theme set to: $FLAVOR"
