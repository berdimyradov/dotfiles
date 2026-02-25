#!/usr/bin/env bash
set -euo pipefail

INPUT="${1:-}"

if [[ -z "$INPUT" ]]; then
  echo "Usage: $0 <light|dark>"
  exit 1
fi

case "$INPUT" in
light)
  GRUVBOX_THEME="light256"
  ;;
dark)
  GRUVBOX_THEME="dark256"
  ;;
*)
  echo "Invalid theme: $INPUT"
  echo "Expected: light or dark"
  exit 1
  ;;
esac

if pgrep -x tmux >/dev/null; then
  tmux set -g @tmux-gruvbox "$GRUVBOX_THEME"
  tmux source-file "$HOME/.config/tmux/tmux.conf"
fi

echo "Tmux gruvbox set to: $GRUVBOX_THEME"
