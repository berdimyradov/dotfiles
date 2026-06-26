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

theme:lazygit() {
  local flavor accent lg_dir themes_dir active_theme theme_file

  flavor="$(theme:_normalize_flavor "${1:-}")" || {
    echo "Usage: theme:lazygit <light|dark>"
    return 1
  }

  accent="blue"
  lg_dir="$HOME/.config/lazygit"
  themes_dir="$lg_dir/themes"
  active_theme="$lg_dir/active_theme.yml"
  theme_file="$themes_dir/catppuccin/$flavor/$accent.yml"

  if [[ ! -f "$theme_file" ]]; then
    echo "LazyGit theme file not found: $theme_file"
    return 1
  fi

  ln -sf "$theme_file" "$active_theme"
  echo "🔀 LazyGit theme: catppuccin/$flavor/$accent"
}

theme:_lazygit_main() {
  set -euo pipefail
  theme:lazygit "${1:-}"
}

if [[ -n "${BASH_SOURCE:-}" && "${BASH_SOURCE[0]}" == "$0" ]]; then
  theme:_lazygit_main "$@"
fi
