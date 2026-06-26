local function active_colorscheme()
  local file = vim.fn.expand("~/.config/nvim/active-colorscheme")

  if vim.fn.filereadable(file) == 1 then
    local theme = vim.fn.trim(vim.fn.readfile(file)[1] or "")

    if theme == "catppuccin-latte" or theme == "catppuccin-mocha" then
      return theme
    end
  end

  return "catppuccin-mocha"
end

return {
  -- Add the Catppuccin plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = false,
      styles = {
        comments = { "italic" },
        keywords = { "bold" },
        types = { "italic", "bold" },
      },
    },
  },

  -- Configure LazyVim to load preferred theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = active_colorscheme(),
    },
  },
}
