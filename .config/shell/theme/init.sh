#!/usr/bin/env zsh

THEME_DIR="${0:A:h}"
THEME_LIGHT_FLAVOR="latte"
THEME_DARK_FLAVOR="mocha"
THEME_ENABLED_ADAPTERS=(ghostty tmux nvim lazygit btop)

THEME_CATPPUCCIN_DIR="$THEME_DIR/catppuccin"

source "$THEME_CATPPUCCIN_DIR/ghostty.sh"
source "$THEME_CATPPUCCIN_DIR/tmux.sh"
source "$THEME_CATPPUCCIN_DIR/nvim.sh"
source "$THEME_CATPPUCCIN_DIR/lazygit.sh"
source "$THEME_CATPPUCCIN_DIR/btop.sh"
source "$THEME_CATPPUCCIN_DIR/alacritty.sh"
source "$THEME_CATPPUCCIN_DIR/git-delta.sh"

theme:_mode_to_flavor() {
  case "${1:-}" in
  light)
    printf '%s\n' "$THEME_LIGHT_FLAVOR"
    ;;
  dark)
    printf '%s\n' "$THEME_DARK_FLAVOR"
    ;;
  *)
    return 1
    ;;
  esac
}

theme:_flavor_to_mode() {
  case "$1" in
  latte)
    printf '%s\n' "light"
    ;;
  mocha)
    printf '%s\n' "dark"
    ;;
  *)
    return 1
    ;;
  esac
}

theme:_set_macos_appearance() {
  local mode="$1"

  case "$mode" in
  dark)
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true' 2>/dev/null ||
      echo "Warning: failed to set macOS appearance to dark"
    ;;
  light)
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false' 2>/dev/null ||
      echo "Warning: failed to set macOS appearance to light"
    ;;
  *)
    echo "Invalid mode: $mode"
    echo "Expected: light or dark"
    return 1
    ;;
  esac
}

theme:_run_adapter() {
  local adapter="$1"
  local flavor="$2"
  local fn="theme:$adapter"

  if ! whence -w "$fn" >/dev/null 2>&1; then
    echo "$adapter: adapter function not found: $fn"
    return 1
  fi

  "$fn" "$flavor"
}

theme:apply() {
  local input="${1:-}"
  local flavor mode adapter
  local -a failures

  flavor="$(theme:_mode_to_flavor "$input")" || {
    echo "Usage: theme <light|dark>"
    return 1
  }

  mode="$(theme:_flavor_to_mode "$flavor")" || return 1

  theme:_set_macos_appearance "$mode"

  for adapter in "${THEME_ENABLED_ADAPTERS[@]}"; do
    if ! theme:_run_adapter "$adapter" "$mode"; then
      failures+=("$adapter")
    fi
  done

  echo "================================================================================"
  echo "Theme: $mode -> catppuccin-$flavor"

  if ((${#failures[@]} > 0)); then
    echo "Failed adapters: ${failures[*]}"
    echo "================================================================================"
    return 1
  fi

  echo "All adapters applied: ${THEME_ENABLED_ADAPTERS[*]}"
  echo "================================================================================"
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
