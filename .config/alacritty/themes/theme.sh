#!/usr/bin/env bash
#
# Alacritty Theme Switcher
# Sets the active theme by symlinking the desired theme file to active_theme.toml
#

set -e

ALAC_DIR="$HOME/.config/alacritty"
THEMES_DIR="$ALAC_DIR/themes"
ACTIVE_THEME="$THEMES_DIR/active_theme.toml"

# Collect theme candidates dynamically
THEMES=()
while IFS= read -r line; do
  THEMES+=("$line")
done < <(find "$THEMES_DIR" -type f -name "*.toml" ! -name "active_theme.toml" | sort)

if ((${#THEMES[@]} == 0)); then
  echo "No theme .toml files found in $THEMES_DIR."
  exit 1
fi

choose_theme() {
  if command -v fzf >/dev/null 2>&1; then
    printf "%s\n" "${THEMES[@]#$THEMES_DIR/}" | fzf --prompt="Alacritty theme > "
  else
    echo "Choose a theme:"
    local i=1
    for t in "${THEMES[@]}"; do
      echo "  $i) ${t#$THEMES_DIR/}"
      i=$((i + 1))
    done
    printf "Enter number: "
    read -r n
    [[ "$n" =~ ^[0-9]+$ ]] || exit 1
    ((n >= 1 && n <= ${#THEMES[@]})) || exit 1
    echo "${THEMES[$((n - 1))]}"
  fi
}

THEME_INPUT="${1:-}"

if [ -n "$THEME_INPUT" ]; then
  THEME_BASENAME="${THEME_INPUT%.toml}"
  THEME_FILE="$THEMES_DIR/$THEME_BASENAME.toml"

  if [[ ! -f "$THEME_FILE" ]]; then
    # Try looking in subdirectories or partial match
    MATCH=$(find "$THEMES_DIR" -path "*/$THEME_BASENAME.toml" | head -n 1)
    if [[ -z "$MATCH" ]]; then
        # Last resort: partial filename match
        for t in "${THEMES[@]}"; do
            if [[ "$(basename "$t")" == *"$THEME_BASENAME"* ]]; then
                MATCH="$t"
                break
            fi
        done
    fi
    
    if [[ -n "$MATCH" ]]; then
      THEME_FILE="$MATCH"
    else
      echo "Error: Theme '$THEME_INPUT' not found in $THEMES_DIR"
      exit 1
    fi
  fi
else
  PICKED=$(choose_theme)
  [ -n "$PICKED" ] || exit 0
  # If choose_theme returned a relative path (from fzf output mapping)
  if [[ "$PICKED" != /* ]]; then
    THEME_FILE="$THEMES_DIR/$PICKED"
  else
    THEME_FILE="$PICKED"
  fi
fi

# Create symlink for active theme
ln -sf "$THEME_FILE" "$ACTIVE_THEME"

echo "🖥️ Alacritty theme set to: $(basename "$THEME_FILE" .toml) (${THEME_FILE#$THEMES_DIR/})"
