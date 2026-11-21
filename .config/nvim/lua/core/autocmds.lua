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
