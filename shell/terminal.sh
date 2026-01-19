# Added by LM Studio CLI (lms)
export PATH="$PATH:~/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="~/.antigravity/antigravity/bin:$PATH"

# Theme switching functions for Alacritty, Tmux, and Neovim
function dark() {
  ~/shell/alacritty/theme.sh "github-dark-high-contrast"
  ~/shell/tmux/theme.sh "mocha"
  ~/shell/nvim/colorscheme.sh "mocha"
}

function light() {
  ~/shell/alacritty/theme.sh "catppuccin-latte"
  ~/shell/tmux/theme.sh "latte"
  ~/shell/nvim/colorscheme.sh "latte"
}
