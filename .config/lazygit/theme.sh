#!/usr/bin/env bash
#
# LazyGit Theme Switcher
# Sets the active theme by symlinking the desired theme file to active_theme.yml
#

set -e

LG_DIR="$HOME/.config/lazygit"
THEMES_DIR="$LG_DIR/themes"
ACTIVE_THEME="$LG_DIR/active_theme.yml"

THEME_NAME="${1:-}"

if [[ -z "$THEME_NAME" ]]; then
    echo "Usage: $0 <theme_name>"
    echo "Example: $0 dracula.dark"
    exit 1
fi

# Construct potential theme file paths
THEME_BASENAME="${THEME_NAME%.yml}"
THEME_FILE="$THEMES_DIR/$THEME_BASENAME.yml"

if [[ ! -f "$THEME_FILE" ]]; then
    # Try looking in subdirectories (like catppuccin)
    MATCH=$(find "$THEMES_DIR" -path "*/$THEME_BASENAME.yml" | head -n 1)
    if [[ -n "$MATCH" ]]; then
        THEME_FILE="$MATCH"
    else
        echo "Error: Theme '$THEME_NAME' not found in $THEMES_DIR"
        exit 1
    fi
fi

# Create symlink for active theme
ln -sf "$THEME_FILE" "$ACTIVE_THEME"

echo "🔀 LazyGit theme set to: $(basename "$THEME_FILE" .yml) (${THEME_FILE#$THEMES_DIR/})"