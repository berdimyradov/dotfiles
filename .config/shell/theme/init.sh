#!/usr/bin/env zsh

THEME_DIR="${0:A:h}"

THEME_CATPPUCCIN_DIR="$THEME_DIR/catppuccin"

source "$THEME_CATPPUCCIN_DIR/btop.sh"

theme:_set_macos_appearance() {
  local mode="$1"

  case "$mode" in
  dark)
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
    ;;
  light)
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'
    ;;
  *)
    echo "Invalid mode: $mode"
    echo "Expected: light or dark"
    return 1
    ;;
  esac
}

theme:apply() {
  local mode="${1:-}"

  case "$mode" in
  light | dark) ;;
  *)
    echo "Usage: theme <light|dark>"
    return 1
    ;;
  esac

  if ! theme:_set_macos_appearance "$mode"; then
    echo "Failed to set macOS appearance to $mode"
    return 1
  fi

  if ! theme:btop "$mode"; then
    echo "macOS appearance set to $mode; btop theme update failed"
    return 1
  fi

  echo "macOS appearance set to $mode; btop theme updated"
}

theme() {
  theme:apply "${1:-}"
}

dark() {
  theme:apply dark
}

light() {
  theme:apply light
}
