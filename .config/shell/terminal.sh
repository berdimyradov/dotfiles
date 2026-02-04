# Added by LM Studio CLI (lms)
export PATH="$PATH:~/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="~/.antigravity/antigravity/bin:$PATH"

# Theme switching functions for Alacritty, Tmux, and Neovim
function dark() {
  ~/.config/shell/alacritty/theme.sh "github-dark-high-contrast"
  ~/.config/shell/tmux/theme.sh "mocha"
  ~/.config/shell/nvim/colorscheme.sh "mocha"
  ~/.config/shell/git/delta-theme.sh "colibri"
  alias lgit="lazygit:dark"
}

function light() {
  ~/.config/shell/alacritty/theme.sh "catppuccin-latte"
  ~/.config/shell/tmux/theme.sh "latte"
  ~/.config/shell/nvim/colorscheme.sh "latte"
  ~/.config/shell/git/delta-theme.sh "hoopoe"
  alias lgit="lazygit:light"
}
