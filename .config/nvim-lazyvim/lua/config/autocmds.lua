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

-- TODO: FIX: not working
-- Automatically enforce English and Russian spellcheck for Markdown files
-- vim.api.nvim_create_autocmd("FileType", {
--   group = vim.api.nvim_create_augroup("lazyvim_markdown_spell", { clear = true }),
--   pattern = { "markdown", "gitcommit" },
--   callback = function()
--     vim.opt_local.spell = true
--     vim.opt_local.spelllang = { "en", "ru" }
--   end,
-- })
