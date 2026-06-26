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

theme:git-delta() {
  local flavor delta_config

  flavor="$(theme:_normalize_flavor "${1:-}")" || {
    echo "Usage: theme:git-delta <light|dark>"
    return 1
  }

  delta_config="$HOME/.config/git/delta/active-theme.gitconfig"
  git config --file "$delta_config" delta.features "$flavor"

  echo "Delta theme: $flavor"
}

theme:_git_delta_main() {
  set -euo pipefail
  theme:git-delta "${1:-}"
}

if [[ -n "${BASH_SOURCE:-}" && "${BASH_SOURCE[0]}" == "$0" ]]; then
  theme:_git_delta_main "$@"
fi
