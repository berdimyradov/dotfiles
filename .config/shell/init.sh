# Main

# Zsh
# https://github.com/zsh-users
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/shell/zsh/init.sh

# General
source ~/.config/shell/aliases.sh
source ~/.config/shell/exports.sh
source ~/.config/shell/fzf.sh
source ~/.config/shell/git/init.sh
source ~/.config/shell/theme/init.sh

# TUI
source ~/.config/lazygit/init.sh
source ~/.config/tmux/init.sh

# Terminal
# source ~/.config/alacritty/init.sh
source ~/.config/ghostty/init.sh
source ~/.config/shell/terminal.sh

# Optional
# source ~/.config/shell/docker.sh
# source ~/.rcs/flutter.sh

## `randy` aliases
alias randy='cargo run --manifest-path ~/my-projects/randy/Cargo.toml -p randy-cli --'
alias lazyrandy='cargo run --manifest-path ~/my-projects/randy/Cargo.toml -p lazyrandy --'
# `dev-randy`
alias dev-randy='cargo run --manifest-path ~/my-projects/randy/Cargo.toml -p randy-cli --'
alias dev-lazyrandy='cargo run --manifest-path ~/my-projects/randy/Cargo.toml -p lazyrandy --'
