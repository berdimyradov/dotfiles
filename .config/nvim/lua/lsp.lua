vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

vim.lsp.config("vtsls", {})
vim.lsp.config("jsonls", {})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("MinimalLsp", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client or not client:supports_method("textDocument/completion") then
      return
    end

    vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    vim.keymap.set("i", "<C-Space>", function()
      vim.lsp.completion.get()
    end, { buffer = event.buf, desc = "Trigger LSP completion" })
  end,
})

vim.lsp.enable({ "lua_ls", "vtsls", "jsonls" })
