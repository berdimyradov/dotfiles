# Dotfiles

Personal development environment configuration for terminal-first workflows.

## What's included

- **Shell** (`.zshrc`, `.config/shell/*`)
  - Modular shell setup (aliases, exports, terminal behavior, fzf helpers)
  - Entry point from `.zshrc` into `.config/shell/init.sh`
- **Neovim** (`.config/nvim`)
  - LazyVim-based setup with lockfile and formatter config
- **Tmux** (`.config/tmux`)
  - Vim-style pane navigation, window shortcuts, and TPM plugins
- **Alacritty** (`.config/alacritty`)
  - Theme imports and keybindings for macOS-friendly terminal behavior
- **Git** (`.gitconfig`, `.config/git/.gitconfig`)
  - Shared git config include pattern with custom aliases and defaults
- **Lazygit** (`.config/lazygit`)
  - UI preferences and editor integration
- **Vifm / Nano** (`.config/vifm`, `.nanorc`)

## Repository layout

```text
.
├── .config/
│   ├── alacritty/
│   ├── git/
│   ├── lazygit/
│   ├── nvim/
│   ├── shell/
│   ├── tmux/
│   └── vifm/
├── .gitconfig
├── .nanorc
├── .vimrc
└── .zshrc
```

## Quick start

> Adjust for your OS and package manager as needed.

1. Clone this repository:

   ```bash
   git clone <your-fork-or-this-repo-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Create symlinks for configs (manual method):

   ```bash
   ln -sf ~/.dotfiles/.zshrc ~/.zshrc
   ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
   ln -sf ~/.dotfiles/.vimrc ~/.vimrc
   ln -sf ~/.dotfiles/.nanorc ~/.nanorc

   mkdir -p ~/.config
   ln -sfn ~/.dotfiles/.config/alacritty ~/.config/alacritty
   ln -sfn ~/.dotfiles/.config/git ~/.config/git
   ln -sfn ~/.dotfiles/.config/lazygit ~/.config/lazygit
   ln -sfn ~/.dotfiles/.config/nvim ~/.config/nvim
   ln -sfn ~/.dotfiles/.config/shell ~/.config/shell
   ln -sfn ~/.dotfiles/.config/tmux ~/.config/tmux
   ln -sfn ~/.dotfiles/.config/vifm ~/.config/vifm
   ```

3. Install expected tools/fonts (recommended):
   - `zsh`
   - `neovim`
   - `tmux`
   - `alacritty`
   - `lazygit`
   - `fzf`
   - Nerd Font (this setup uses **JetBrainsMono Nerd Font**)

4. Reload shell:

   ```bash
   exec zsh
   ```

## Notes

- Some shell imports reference machine-specific paths under `/opt/homebrew` and extra local scripts under `.config/shell/*`.
- Git identity in `.config/git/.gitconfig` is personal; replace values with your own if reusing this setup.
- Neovim folder currently follows the LazyVim starter layout and can be customized further.

## License

This repository is for personal use. Reuse patterns freely, but review and adapt all personal values/paths first.
