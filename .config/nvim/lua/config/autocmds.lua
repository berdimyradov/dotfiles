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

-- Retain Catppuccin's CursorLine background while making the active Neo-tree row bold.
-- local function apply_neotree_cursorline()
--   local cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false })
--   vim.api.nvim_set_hl(0, "NeoTreeCursorLine", {
--     bg = cursorline.bg,
--     bold = true,
--   })
-- end
--
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   group = vim.api.nvim_create_augroup("NeoTreeCursorLine", { clear = true }),
--   callback = apply_neotree_cursorline,
-- })
--
-- apply_neotree_cursorline()
