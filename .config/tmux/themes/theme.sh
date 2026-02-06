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

THEME_FILE="$HOME/.config/tmux/themes/catppuccin/active_flavor.conf"

# Link the active flavor config
FLAVOR_FILE="$(dirname "$THEME_FILE")/${FLAVOR}.conf"
if [[ -f "$FLAVOR_FILE" ]]; then
  ln -sf "$FLAVOR_FILE" "$THEME_FILE"
else
  echo "Error: Flavor file $FLAVOR_FILE not found."
  exit 1
fi

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
