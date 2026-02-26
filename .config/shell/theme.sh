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
    alac:theme "carbonfox"
    tmux:theme "dark"
    ~/.config/shell/nvim/colorscheme.sh "carbonfox"
    ~/.config/shell/git/delta-theme.sh "carbonfox"
    ~/.config/lazygit/theme.sh "dracula.dark"

    echo "================================================================================"
    echo "🌚 Switched to dark theme"
    echo "================================================================================"
  elif [[ "$THEME_MODE" == "light" ]]; then
    alac:theme "dayfox"
    tmux:theme "light"
    ~/.config/shell/nvim/colorscheme.sh "dayfox"
    ~/.config/shell/git/delta-theme.sh "dayfox"
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
