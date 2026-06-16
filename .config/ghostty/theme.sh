#!/usr/bin/env bash
set -e

ghostty:theme() {
  case "$1" in
  carbonfox | dark) theme="Carbonfox" ;;
  dayfox | light) theme="Dayfox" ;;
  auto | system) theme="light:Dayfox,dark:Carbonfox" ;;
  *)
    echo "Invalid Ghostty theme: $1"
    echo "Expected: carbonfox, dayfox, dark, light, auto, or system"
    return 1
    ;;
  esac

  active="$HOME/.config/ghostty/active_theme"

  if [[ -f "$active" ]] && grep -q '^theme =' "$active"; then
    sed -i '' "s/^theme = .*/theme = $theme/" "$active"
  else
    printf 'theme = %s\n' "$theme" >"$active"
  fi

  echo "👻 Ghostty theme set to: $theme"
}
