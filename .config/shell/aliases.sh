# ────────────────────────────────────────────────────────────────────────────────
# Editor
# ────────────────────────────────────────────────────────────────────────────────

alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"

# ────────────────────────────────────────────────────────────────────────────────
# Filesystem
# ────────────────────────────────────────────────────────────────────────────────

# Recursively print each file's name then its contents
alias lfcat='find . -type f -exec echo "Filename: {}" \; -exec cat {} \;'

# ────────────────────────────────────────────────────────────────────────────────
# Dotfiles
# ────────────────────────────────────────────────────────────────────────────────

# Manage $HOME as a git worktree backed by a bare repo at ~/.dotfiles
alias config='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

# ────────────────────────────────────────────────────────────────────────────────
# System / Notifications
# ────────────────────────────────────────────────────────────────────────────────

alias bell='afplay /System/Library/Sounds/Ping.aiff'
alias notify="osascript -e 'display notification \"Command has completed\" with title \"Notification\" sound name \"Ping\"'"

# ────────────────────────────────────────────────────────────────────────────────
# Date / Time
# ────────────────────────────────────────────────────────────────────────────────

# Prints: YYYY MonthName D HH:MM:SS
alias now='date +"%Y %B %-d %H:%M:%S"'

# ────────────────────────────────────────────────────────────────────────────────
# Network
# ────────────────────────────────────────────────────────────────────────────────

# Display public IP address and country location
alias myip='echo -e "🌐 IP: $(curl -s ipinfo.io/ip)\n📍 Country: $(curl -s ipinfo.io/country)"'

# ────────────────────────────────────────────────────────────────────────────────
# AI Agents
# ────────────────────────────────────────────────────────────────────────────────

alias oc='opencode'
alias cc='claude'
alias cx='codex'

# ────────────────────────────────────────────────────────────────────────────────
# Package Managers
# ────────────────────────────────────────────────────────────────────────────────

alias pm='pnpm'

# ────────────────────────────────────────────────────────────────────────────────
# Optional / Uncomment as Needed
# ────────────────────────────────────────────────────────────────────────────────

# alias ls="colorls"                       # Fancy colored `ls` output
# alias ohmyzsh="mate ~/.oh-my-zsh"        # Edit your Oh My Zsh install in TextMate
# alias prettyjson="python -m json.tool"   # Pretty-print JSON on the fly
# bindkey -v                               # Enable vi-mode keybindings in zsh
