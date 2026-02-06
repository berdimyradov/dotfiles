# Added by LM Studio CLI (lms)
export PATH="$PATH:~/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="~/.antigravity/antigravity/bin:$PATH"

# ================================================================================
# Theme switching functions
# ================================================================================
function dark() {
  alac:theme "github-dark-high-contrast"
  tmux:theme "mocha"
  ~/.config/shell/nvim/colorscheme.sh "mocha"
  ~/.config/shell/git/delta-theme.sh "colibri"
  ~/.config/lazygit/theme.sh "dracula.dark"

  echo "================================================================================";
  echo "🌚 Switched to dark theme";
  echo "================================================================================";
}

function light() {
  alac:theme "catppuccin-latte"
  tmux:theme "latte"
  ~/.config/shell/nvim/colorscheme.sh "latte"
  ~/.config/shell/git/delta-theme.sh "hoopoe"
  ~/.config/lazygit/theme.sh "light"

  echo "================================================================================";
  echo "🌝 Switched to light theme";
  echo "================================================================================";
}
