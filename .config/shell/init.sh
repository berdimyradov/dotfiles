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

# Terminal
source ~/.config/ghostty/init.sh
source ~/.config/shell/terminal.sh

# Optional
# source ~/.config/shell/docker.sh

## `randy` aliases
alias randy='cargo run --manifest-path ~/my-projects/randy/Cargo.toml -p randy-cli --'
alias lazyrandy='cargo run --manifest-path ~/my-projects/randy/Cargo.toml -p lazyrandy --'
# `dev-randy`
alias dev-randy='cargo run --manifest-path ~/my-projects/randy/Cargo.toml -p randy-cli --'
alias dev-lazyrandy='cargo run --manifest-path ~/my-projects/randy/Cargo.toml -p lazyrandy --'

## `excalidraw` aliases
_excalidraw_up() {
  docker info >/dev/null 2>&1 || {
    echo "Start Docker first." >&2
    return 1
  }

  # Pull the latest image before replacing the container.
  docker pull excalidraw/excalidraw:latest || return 1

  if docker container inspect excalidraw >/dev/null 2>&1; then
    docker rm -f excalidraw >/dev/null || return 1
  fi

  docker run -d \
    --name excalidraw \
    --restart unless-stopped \
    -p 127.0.0.1:9999:80 \
    excalidraw/excalidraw:latest >/dev/null || return 1

  echo "Excalidraw: http://localhost:9999"
}

alias xu='_excalidraw_up'
alias xd='docker stop excalidraw'
alias xr='_excalidraw_up'
