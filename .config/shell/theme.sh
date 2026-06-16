function dark() {
  osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

  # alac:theme "carbonfox"
  tmux:theme "carbonfox"
  ~/.config/shell/nvim/colorscheme.sh "carbonfox"
  ~/.config/shell/git/delta-theme.sh "carbonfox"
  ~/.config/lazygit/theme.sh "carbonfox"
  ~/.config/btop/theme.sh "carbonfox"

  echo "================================================================================"
  echo "🌚 Switched to dark theme"
  echo "================================================================================"
}

function light() {
  osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'

  # alac:theme "dayfox"
  tmux:theme "dayfox"
  ~/.config/shell/nvim/colorscheme.sh "dayfox"
  ~/.config/shell/git/delta-theme.sh "dayfox"
  ~/.config/lazygit/theme.sh "dayfox"
  ~/.config/btop/theme.sh "dayfox"

  echo "================================================================================"
  echo "🌝 Switched to light theme"
  echo "================================================================================"
}
