# ================================================================================
# Theme detection
# ================================================================================
function system_appereance() {
  if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -iq "Dark"; then
    echo "dark"
  else
    echo "light"
  fi
}


# ================================================================================
# Theme switching functions
# ================================================================================
function theme() {
  THEME_MODE="$1"

  if [ -z "$THEME_MODE" ]; then
    THEME_MODE="$(system_appereance)"
  fi

  if [[ "$THEME_MODE" == "dark" ]]; then
    alac:theme "github-dark-high-contrast"
    tmux:theme "mocha"
    ~/.config/shell/nvim/colorscheme.sh "mocha"
    ~/.config/shell/git/delta-theme.sh "colibri"
    ~/.config/lazygit/theme.sh "dracula.dark"

    echo "================================================================================"
    echo "🌚 Switched to dark theme"
    echo "================================================================================"
  elif [[ "$THEME_MODE" == "light" ]]; then
    alac:theme "catppuccin-latte"
    tmux:theme "latte"
    ~/.config/shell/nvim/colorscheme.sh "latte"
    ~/.config/shell/git/delta-theme.sh "hoopoe"
    ~/.config/lazygit/theme.sh "light"

    echo "================================================================================"
    echo "🌝 Switched to light theme"
    echo "================================================================================"
  else
    echo "Usage: theme [dark|light]"
    return
  fi
}

function dark() {
  theme "dark"
}

function light() {
  theme "light"
}