#!/usr/bin/env bash
set -euo pipefail

ALAC_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/alacritty"
CONFIG="$ALAC_DIR/alacritty.toml" # change if yours is different

# Collect theme candidates dynamically
THEMES=()
while IFS= read -r line; do
  THEMES+=("$line")
done < <(
  find "$ALAC_DIR" -maxdepth 1 -type f -name "*.toml" \
    ! -name "alacritty.toml" ! -name "alacritty.yml" \
    -print | sort
)


if ((${#THEMES[@]} == 0)); then
  echo "No theme .toml files found in $ALAC_DIR (excluding alacritty.toml)."
  exit 1
fi

choose_theme() {
  if command -v fzf >/dev/null 2>&1; then
    printf "%s\n" "${THEMES[@]}" | fzf --prompt="Alacritty theme > "
  else
    echo "Choose a theme:"
    local i=1
    for t in "${THEMES[@]}"; do
      echo "  $i) $t"
      i=$((i + 1))
    done
    printf "Enter number: "
    read -r n
    [[ "$n" =~ ^[0-9]+$ ]] || exit 1
    ((n >= 1 && n <= ${#THEMES[@]})) || exit 1
    echo "${THEMES[$((n - 1))]}"
  fi
}

picked="$(choose_theme)"
[ -n "$picked" ] || exit 0

# Convert absolute path -> "~/" form (matches your existing import style)
if [[ "$picked" == "$HOME/"* ]]; then
  theme_path="~/${picked#$HOME/}"
else
  theme_path="$picked"
fi

# Replace the theme path inside the import = [ ... ] block
# (Compatible with both GNU and BSD sed; creates .bak backup)
sed -i.bak -E "/import[[:space:]]*=[[:space:]]*\[/,/]/ s|\"[^\"]+\"|\"${theme_path}\"|" "$CONFIG"


echo "Theme set to: $theme_path"
echo "Backup written to: ${CONFIG}.bak"
