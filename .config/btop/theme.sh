#!/usr/bin/env bash
set -euo pipefail

THEME="${1:-}"
BTOP_DIR="$HOME/.config/btop"
THEMES_DIR="$BTOP_DIR/themes"
ACTIVE_THEME="$THEMES_DIR/active.theme"
CONFIG_FILE="$BTOP_DIR/btop.conf"

if [[ -z "$THEME" ]]; then
  echo "Usage: $0 <carbonfox|dayfox>"
  exit 1
fi

case "$THEME" in
carbonfox | dayfox) ;;
*)
  echo "Invalid theme: $THEME"
  echo "Expected: carbonfox or dayfox"
  exit 1
  ;;
esac

THEME_FILE="$THEMES_DIR/$THEME.theme"

if [[ ! -f "$THEME_FILE" ]]; then
  echo "Error: Theme file not found: $THEME_FILE"
  exit 1
fi

if [[ -e "$ACTIVE_THEME" && ! -L "$ACTIVE_THEME" ]]; then
  echo "Error: Active theme exists and is not a symlink: $ACTIVE_THEME"
  exit 1
fi

ln -sfn "$THEME_FILE" "$ACTIVE_THEME"

if grep -q '^color_theme[[:space:]]*=' "$CONFIG_FILE"; then
  sed -i '' 's/^color_theme[[:space:]]*=.*/color_theme = "active"/' "$CONFIG_FILE"
else
  printf '\ncolor_theme = "active"\n' >> "$CONFIG_FILE"
fi

echo "📊 btop theme: $THEME"
