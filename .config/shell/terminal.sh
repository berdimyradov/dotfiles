# Added by LM Studio CLI (lms)
export PATH="$PATH:~/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="~/.antigravity/antigravity/bin:$PATH"

# ================================================================================
# Theme switching functions
# ================================================================================
function theme() {

  SYSTEM_APPEREANCE='light'
  if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -iq "Dark"; then
    SYSTEM_APPEREANCE='dark'
  else
    SYSTEM_APPEREANCE='light'
  fi

  if [ -z "$1" ]; then
    THEME_MODE="$SYSTEM_APPEREANCE"
  else
    THEME_MODE="$1"
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
    echo "Usage: theme [dark|light] (or set \$THEME_MODE)"
  fi
}

function dark() {
  theme "dark"
}

function light() {
  theme "light"
}