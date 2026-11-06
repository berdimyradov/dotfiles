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
  local flavor btop_dir themes_dir active_theme config_file theme_file grep_status uid pkill_output pkill_status

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

  if ! ln -sfn "$theme_file" "$active_theme"; then
    echo "failed to update btop active theme symlink: $active_theme" >&2
    return 1
  fi

  if [[ ! -e "$config_file" && ! -L "$config_file" ]]; then
    if ! printf '\ncolor_theme = "active"\n' >>"$config_file"; then
      echo "failed to write btop config: $config_file" >&2
      return 1
    fi
  else
    if grep -q '^color_theme[[:space:]]*=' "$config_file"; then
      if ! sed -i '' 's/^color_theme[[:space:]]*=.*/color_theme = "active"/' "$config_file"; then
        echo "failed to update btop config: $config_file" >&2
        return 1
      fi
    else
      grep_status=$?
      if [[ "$grep_status" -ne 1 ]]; then
        echo "failed to read btop config: $config_file" >&2
        return 1
      fi
      if ! printf '\ncolor_theme = "active"\n' >>"$config_file"; then
        echo "failed to write btop config: $config_file" >&2
        return 1
      fi
    fi
  fi

  if ! uid="$(id -u)"; then
    echo "failed to determine current user ID; btop theme was updated without signaling" >&2
    return 1
  fi

  if pkill_output="$(pkill -USR2 -u "$uid" -x btop 2>&1)"; then
    pkill_status=0
  else
    pkill_status=$?
  fi

  if [[ -n "$pkill_output" ]]; then
    printf '%s\n' "$pkill_output" >&2
    echo "failed to request btop theme reload" >&2
    return 1
  fi

  case "$pkill_status" in
    0)
      echo "📊 btop theme: $flavor; reload requested"
      ;;
    1)
      echo "📊 btop theme: $flavor; no running btop instances, applies on next launch"
      ;;
    *)
      echo "failed to request btop theme reload (pkill exit $pkill_status)" >&2
      return 1
      ;;
  esac
}

theme:_btop_main() {
  set -euo pipefail
  theme:btop "${1:-}"
}

if [[ -n "${BASH_SOURCE:-}" && "${BASH_SOURCE[0]}" == "$0" ]]; then
  theme:_btop_main "$@"
fi
