#!/usr/bin/env bash
set -euo pipefail

INPUT="${1:-}"

# ================================================================================
# Theme detection
# ================================================================================
system_appereance() {
  if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -iq "Dark"; then
    echo "dark"
  else
    echo "light"
  fi
}

# No arg: infer from macOS appearance.
if [[ -z "$INPUT" ]]; then
  SYSTEM_APPEARANCE="$(system_appereance)"

  case "$SYSTEM_APPEARANCE" in
  light)
    INPUT="dayfox"
    ;;
  dark)
    INPUT="carbonfox"
    ;;
  *)
    echo "Invalid system appearance: $SYSTEM_APPEARANCE"
    echo "Expected: light or dark"
    exit 1
    ;;
  esac
fi

case "$INPUT" in
carbonfox)
  THEME_FILE="$HOME/.config/tmux/themes/nightfox/carbonfox.tmux"
  ;;
dayfox)
  THEME_FILE="$HOME/.config/tmux/themes/nightfox/dayfox.tmux"
  ;;
*)
  echo "Invalid theme: $INPUT"
  echo "Expected: carbonfox or dayfox"
  exit 1
  ;;
esac

if [[ ! -f "$THEME_FILE" ]]; then
  echo "Theme file not found: $THEME_FILE"
  exit 1
fi

if pgrep -x tmux >/dev/null; then
  tmux source-file "$THEME_FILE"
fi

echo "🪟 Tmux theme set to: $INPUT"
