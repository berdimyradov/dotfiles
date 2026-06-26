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

theme:ghostty() {
  local flavor theme active

  flavor="$(theme:_normalize_flavor "${1:-}")" || {
    echo "Usage: theme:ghostty <light|dark>"
    return 1
  }

  case "$flavor" in
  latte)
    theme="Catppuccin Latte"
    ;;
  mocha)
    theme="Catppuccin Mocha"
    ;;
  esac

  active="$HOME/.config/ghostty/active_theme"

  if [[ -f "$active" ]] && grep -q '^theme =' "$active"; then
    sed -i '' "s/^theme = .*/theme = $theme/" "$active"
  else
    printf 'theme = %s\n' "$theme" >"$active"
  fi

  echo "👻 Ghostty theme: $theme"
}

theme:_ghostty_main() {
  set -euo pipefail
  theme:ghostty "${1:-}"
}

if [[ -n "${BASH_SOURCE:-}" && "${BASH_SOURCE[0]}" == "$0" ]]; then
  theme:_ghostty_main "$@"
fi
