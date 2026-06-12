local function active_colorscheme()
  local file = vim.fn.expand("~/.config/nvim/active-colorscheme")

  if vim.fn.filereadable(file) == 1 then
    local theme = vim.fn.trim(vim.fn.readfile(file)[1] or "")

    if theme == "carbonfox" or theme == "dayfox" then
      return theme
    end
  end

  return "carbonfox"
end

return {
  -- Add the nightfox plugin
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = false,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    },
  },

  -- Configure LazyVim to load preffered theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = active_colorscheme(),
    },
  },
}
