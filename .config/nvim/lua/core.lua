vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.laststatus = 2
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
vim.opt.sessionoptions = {
  "buffers",
  "curdir",
  "folds",
  "globals",
  "help",
  "tabpages",
  "winsize",
  "terminal",
  "localoptions",
}

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>,", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>er", "<cmd>Neotree reveal<cr>", {
  desc = "Reveal current file in Neo-tree",
})

vim.keymap.set("n", "<leader>y", function()
  local cwd = vim.fn.expand("%:p:h")
  if cwd == "" then
    cwd = vim.fn.getcwd()
  end

  Snacks.terminal("yazi", {
    cwd = cwd,
    win = {
      position = "float",
      relative = "editor",
      border = "double",
    },
  })
end, { desc = "Open Yazi in a floating terminal" })

vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>ls<cr>", { desc = "List buffers" })

vim.keymap.set("n", "<leader>qs", "<cmd>AutoSession search<cr>", { desc = "Session Search" })
vim.keymap.set("n", "<leader>qr", "<cmd>AutoSession restore<cr>", { desc = "Session Restore" })
vim.keymap.set("n", "<leader>qw", "<cmd>AutoSession save<cr>", { desc = "Session Save" })
vim.keymap.set("n", "<leader>qd", "<cmd>AutoSession delete<cr>", { desc = "Session Delete" })
vim.keymap.set("n", "<leader>qa", "<cmd>AutoSession toggle<cr>", { desc = "Session Toggle Autosave" })

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
