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

theme:btop() {
  local flavor btop_dir themes_dir active_theme config_file theme_file

  flavor="$(theme:_normalize_flavor "${1:-}")" || {
    echo "Usage: theme:btop <light|dark>"
    return 1
  }

  btop_dir="$HOME/.config/btop"
  themes_dir="$btop_dir/themes"
  active_theme="$themes_dir/active.theme"
  config_file="$btop_dir/btop.conf"
  theme_file="$themes_dir/$flavor.theme"

  if [[ ! -f "$theme_file" ]]; then
    echo "btop theme file not found: $theme_file"
    return 1
  fi

  if [[ -e "$active_theme" && ! -L "$active_theme" ]]; then
    echo "btop active theme exists and is not a symlink: $active_theme"
    return 1
  fi

  ln -sfn "$theme_file" "$active_theme"

  if grep -q '^color_theme[[:space:]]*=' "$config_file"; then
    sed -i '' 's/^color_theme[[:space:]]*=.*/color_theme = "active"/' "$config_file"
  else
    printf '\ncolor_theme = "active"\n' >>"$config_file"
  fi

  echo "btop theme: $flavor"
}

theme:_btop_main() {
  set -euo pipefail
  theme:btop "${1:-}"
}

if [[ -n "${BASH_SOURCE:-}" && "${BASH_SOURCE[0]}" == "$0" ]]; then
  theme:_btop_main "$@"
fi
