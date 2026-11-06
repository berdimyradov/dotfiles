#!/usr/bin/env bash

set -euo pipefail

usage() {
  echo "Usage: $0 --socket <path> <auto|light|dark> [--force]" >&2
  exit 2
}

socket=""
mode=""
force=0
while (($#)); do
  case "$1" in
    --socket)
      (($# >= 2)) || usage
      socket="$2"
      shift 2
      ;;
    --force)
      force=1
      shift
      ;;
    auto|light|dark)
      [[ -z "$mode" ]] || usage
      mode="$1"
      shift
      ;;
    *) usage ;;
  esac
done
[[ -n "$socket" && -n "$mode" ]] || usage

tmux_bin="${TMUX_BIN:-tmux}"
tmux() {
  command "$tmux_bin" -S "$socket" "$@"
}

case "$mode" in
  light) flavor=latte ;;
  dark) flavor=mocha ;;
  auto)
    client_theme="$(tmux display-message -p '#{client_theme}' 2>/dev/null || true)"
    case "$client_theme" in
      light) flavor=latte ;;
      dark) flavor=mocha ;;
      *)
        if [[ -r /usr/bin/defaults ]]; then
          defaults_output="$(/usr/bin/defaults read -g AppleInterfaceStyle 2>&1)" && defaults_status=0 || defaults_status=$?
          if ((defaults_status == 0)); then
            appearance="$defaults_output"
            case "$appearance" in
              Dark) flavor=mocha ;;
              "") flavor=latte ;;
              *)
                flavor="$(tmux show-option -gqv @catppuccin_flavor 2>/dev/null || true)"
                case "$flavor" in
                  latte|mocha) ;;
                  *) flavor=mocha ;;
                esac
                echo "Catppuccin: unexpected macOS appearance '$appearance'; retaining valid flavor or using mocha" >&2
                ;;
            esac
          elif [[ "$defaults_output" == *"does not exist"* || "$defaults_output" == *"not found"* ]]; then
            flavor=latte
          else
            flavor="$(tmux show-option -gqv @catppuccin_flavor 2>/dev/null || true)"
            case "$flavor" in
              latte|mocha) ;;
              *) flavor=mocha ;;
            esac
            echo "Catppuccin: failed to read macOS appearance ($defaults_output); retaining valid flavor or using mocha" >&2
          fi
        else
          flavor="$(tmux show-option -gqv @catppuccin_flavor 2>/dev/null || true)"
          case "$flavor" in
            latte|mocha) ;;
            *) flavor=mocha ;;
          esac
          echo "Catppuccin: cannot read macOS appearance; retaining valid flavor or using mocha" >&2
        fi
        ;;
    esac
    ;;
esac

config_dir="$(cd "$(dirname "$0")/../../.." && pwd)"
plugin_dir="$config_dir/tmux/plugins/tmux"
palette_file="$plugin_dir/themes/catppuccin_${flavor}_tmux.conf"
options_file="$plugin_dir/catppuccin_options_tmux.conf"
main_file="$plugin_dir/catppuccin_tmux.conf"
ui_file="$(dirname "$0")/ui.conf"

for required in "$palette_file" "$options_file" "$main_file" "$ui_file"; do
  if [[ ! -r "$required" ]]; then
    echo "Catppuccin: required theme file is missing or unreadable: $required" >&2
    exit 1
  fi
done

applied="$(tmux show-option -gqv @catppuccin_applied_flavor 2>/dev/null || true)"
if ((force == 0)) && [[ "$applied" == "$flavor" ]]; then
  exit 0
fi

previous_fg="$(tmux show-option -gqv @thm_fg 2>/dev/null || true)"
previous_crust="$(tmux show-option -gqv @thm_crust 2>/dev/null || true)"
tmux set-option -gu @catppuccin_applied_flavor

options=(
  @_ctp_status_bg @thm_bg @thm_fg @thm_rosewater @thm_flamingo @thm_pink
  @thm_mauve @thm_red @thm_maroon @thm_peach @thm_yellow @thm_green @thm_teal
  @thm_sky @thm_sapphire @thm_blue @thm_lavender @thm_subtext_1 @thm_subtext_0
  @thm_overlay_2 @thm_overlay_1 @thm_overlay_0 @thm_surface_2 @thm_surface_1
  @thm_surface_0 @thm_mantle @thm_crust
)
for option in "${options[@]}"; do
  tmux set-option -gqu "$option"
done

tmux set-option -g @catppuccin_flavor "$flavor"
tmux source-file "$palette_file"
tmux source-file "$options_file"

# Remove generated default fg/crust values cached by the plugin, but preserve
# custom module colors (including dynamic CPU module formats).
default_colors=("$previous_fg" "$previous_crust")
for candidate in \
  "$plugin_dir/themes/catppuccin_latte_tmux.conf" \
  "$plugin_dir/themes/catppuccin_mocha_tmux.conf"; do
  [[ -f "$candidate" ]] || continue
  while IFS= read -r color; do
    [[ -n "$color" ]] && default_colors+=("$color")
  done < <(sed -nE 's/^set -ogq @thm_(fg|crust) "([^"]+)"/\2/p' "$candidate")
done
if ((${#default_colors[@]})); then
  while IFS= read -r option; do
    value="$(tmux show-option -gqv "$option")"
    for color in "${default_colors[@]}"; do
      if [[ -n "$color" && "$value" == "$color" ]]; then
        tmux set-option -gu "$option"
        break
      fi
    done
  done < <(tmux show-options -g | sed -nE 's/^(@catppuccin_status_[^ ]+_(icon|text)_fg) .*/\1/p')
fi

tmux source-file "$main_file"
tmux source-file "$ui_file"
tmux set-option -g @catppuccin_applied_flavor "$flavor"
