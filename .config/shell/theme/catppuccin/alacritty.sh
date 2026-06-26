#!/usr/bin/env bash

theme:_normalize_flavor() {
  case "${1:-}" in
  light)
    printf '%s\n' "latte"
    ;;
  dark)
    printf '%s\n' "mocha"
    ;;
  *)
    return 1
    ;;
  esac
}

theme:alacritty() {
  local flavor alacritty_dir themes_dir active_theme theme_file

  flavor="$(theme:_normalize_flavor "${1:-}")" || {
    echo "Usage: theme:alacritty <light|dark>"
    return 1
  }

  alacritty_dir="$HOME/.config/alacritty"
  themes_dir="$alacritty_dir/themes"
  active_theme="$themes_dir/active_theme.toml"
  theme_file="$themes_dir/catppuccin-$flavor.toml"

  if [[ ! -f "$theme_file" ]]; then
    echo "Alacritty theme file not found: $theme_file"
    return 1
  fi

  ln -sf "$theme_file" "$active_theme"
  echo "Alacritty theme: catppuccin-$flavor"
}

theme:_alacritty_main() {
  set -euo pipefail
  theme:alacritty "${1:-}"
}

if [[ -n "${BASH_SOURCE:-}" && "${BASH_SOURCE[0]}" == "$0" ]]; then
  theme:_alacritty_main "$@"
fi
