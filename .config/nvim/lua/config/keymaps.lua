-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open Yazi in a floating terminal rooted at the current file's directory.
vim.keymap.set("n", "<leader>y", function()
  Snacks.terminal("yazi", {
    cwd = vim.fn.expand("%:p:h"),
    win = {
      position = "float",
      relative = "editor",
      border = "none",
    },
  })
end, { desc = "Open Yazi in a floating terminal" })
