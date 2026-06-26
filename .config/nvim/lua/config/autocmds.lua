-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Automatically check if files changed on disk and reload them
local function reload_changed_buffer()
  if vim.fn.mode() ~= "c" and vim.fn.bufexists(vim.fn.bufnr()) == 1 then
    vim.cmd("checktime")
  end
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("AutoReloadBuffer", { clear = true }),
  pattern = "*",
  callback = reload_changed_buffer,
})

-- Update colorscheme from active theme file
local active_colorscheme_file = vim.fn.expand("~/.config/nvim/active-colorscheme")

local function active_colorscheme()
  if vim.fn.filereadable(active_colorscheme_file) ~= 1 then
    return nil
  end

  local theme = vim.fn.trim(vim.fn.readfile(active_colorscheme_file)[1] or "")

  if theme == "catppuccin-latte" or theme == "catppuccin-mocha" then
    return theme
  end

  return nil
end

local function apply_active_colorscheme()
  local theme = active_colorscheme()

  if theme and vim.g.colors_name ~= theme then
    vim.cmd.colorscheme(theme)
  end
end

vim.api.nvim_create_autocmd({ "FocusGained", "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("ActiveColorscheme", { clear = true }),
  callback = apply_active_colorscheme,
})
