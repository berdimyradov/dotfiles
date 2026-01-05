# ────────────────────────────────────────────────────────────────────────────────
# Core Aliases
# ────────────────────────────────────────────────────────────────────────────────

# Use Neovim instead of Vim
alias vim="nvim"

# Quickly open your zsh config for editing
alias zshconfig="nvim ~/.zshrc"

# Recursively find all files in the current directory, print each filename, then its contents
alias lfcat='find . -type f -exec echo "Filename: {}" \; -exec cat {} \;'

# Treat your $HOME as a git working tree, with a bare repo at ~/.dotfiles
alias config='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

# ────────────────────────────────────────────────────────────────────────────────
# Optional / Uncomment as Needed
# ────────────────────────────────────────────────────────────────────────────────

# alias ls="colorls"                       # Fancy colored `ls` output
# alias ohmyzsh="mate ~/.oh-my-zsh"        # Edit your Oh My Zsh install in TextMate
# alias prettyjson="python -m json.tool"   # Pretty-print JSON on the fly
# bindkey -v                               # Enable vi-mode keybindings in zsh

# ────────────────────────────────────────────────────────────────────────────────
# Custom Utilities
# ────────────────────────────────────────────────────────────────────────────────

# Prints: YYYY MonthName D HH:MM:SS
alias now='date +"%Y %B %-d %H:%M:%S"'

# Display public IP address and country location
alias myip='echo "IP: $(curl -s ifconfig.co) | Country: $(curl -s ifconfig.co/country)"'
