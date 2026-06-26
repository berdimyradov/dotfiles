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

theme:_tmux_clear_catppuccin_palette() {
  local option
  local -a options=(
    @_ctp_status_bg
    @thm_bg
    @thm_fg
    @thm_rosewater
    @thm_flamingo
    @thm_pink
    @thm_mauve
    @thm_red
    @thm_maroon
    @thm_peach
    @thm_yellow
    @thm_green
    @thm_teal
    @thm_sky
    @thm_sapphire
    @thm_blue
    @thm_lavender
    @thm_subtext_1
    @thm_subtext_0
    @thm_overlay_2
    @thm_overlay_1
    @thm_overlay_0
    @thm_surface_2
    @thm_surface_1
    @thm_surface_0
    @thm_mantle
    @thm_crust
  )

  for option in "${options[@]}"; do
    tmux set-option -gqu "$option"
  done
}

theme:tmux() {
  local flavor theme_file active_theme init_file plugin_dir

  flavor="$(theme:_normalize_flavor "${1:-}")" || {
    echo "Usage: theme:tmux <light|dark>"
    return 1
  }

  theme_file="$HOME/.config/tmux/themes/catppuccin/$flavor.conf"
  active_theme="$HOME/.config/tmux/themes/catppuccin/active_flavor.conf"
  init_file="$HOME/.config/tmux/themes/catppuccin/init.conf"
  plugin_dir="$HOME/.config/tmux/plugins/tmux"

  if [[ ! -f "$theme_file" ]]; then
    echo "tmux theme file not found: $theme_file"
    return 1
  fi

  ln -sf "$theme_file" "$active_theme"

  if pgrep -x tmux >/dev/null 2>&1; then
    tmux source-file "$init_file"
    theme:_tmux_clear_catppuccin_palette
    tmux source-file "$plugin_dir/catppuccin_options_tmux.conf"
    tmux source-file "$plugin_dir/catppuccin_tmux.conf"
  fi

  echo "tmux theme: $flavor"
}

theme:_tmux_main() {
  set -euo pipefail
  theme:tmux "${1:-}"
}

if [[ -n "${BASH_SOURCE:-}" && "${BASH_SOURCE[0]}" == "$0" ]]; then
  theme:_tmux_main "$@"
fi
