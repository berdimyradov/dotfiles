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

theme:nvim() {
  local flavor colorscheme file

  flavor="$(theme:_normalize_flavor "${1:-}")" || {
    echo "Usage: theme:nvim <light|dark>"
    return 1
  }

  colorscheme="catppuccin-$flavor"
  file="$HOME/.config/nvim/active-colorscheme"

  printf "%s\n" "$colorscheme" >"$file"
  echo "Nvim theme: $colorscheme"
}

theme:_nvim_main() {
  set -euo pipefail
  theme:nvim "${1:-}"
}

if [[ -n "${BASH_SOURCE:-}" && "${BASH_SOURCE[0]}" == "$0" ]]; then
  theme:_nvim_main "$@"
fi
