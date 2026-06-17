-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- TESTING Font size setting
-- vim.o.guifont = "JetBrainsMono Nerd Font:h18"

-- Automatically reload files changed outside of Neovim (e.g., via git or external tools)
vim.opt.autoread = true

-- Session behavior.
-- Controls what Neovim stores when a session is saved.
vim.opt.sessionoptions = {
  "buffers",
  "curdir",
  "folds",
  "help",
  "tabpages",
  "winsize",
  "terminal",
  "localoptions",
}
