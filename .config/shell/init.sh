# Main

# Zsh
# https://github.com/zsh-users
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Oh My Zsh
ZSH_DISABLE_COMPFIX=true
export ZSH=~/.oh-my-zsh
# Theme gallery https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Examples: awesomepanda, arrow, robbyrussell.
ZSH_THEME="awesomepanda"
plugins=()
source $ZSH/oh-my-zsh.sh

# General
source ~/.config/shell/aliases.sh
source ~/.config/shell/exports.sh
source <(fzf --zsh)
source ~/.config/shell/git/git-prompt.sh
source ~/.config/shell/functions.zsh
source ~/.config/shell/theme/init.sh

# TUI
source ~/.config/lazygit/init.sh

# Terminal
source ~/.config/ghostty/init.sh

# Optional
# source ~/.config/shell/docker.sh
