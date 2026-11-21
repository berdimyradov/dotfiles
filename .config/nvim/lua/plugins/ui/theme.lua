require("catppuccin").setup({
  flavour = "auto",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  styles = {
    comments = { "italic" },
    keywords = { "bold" },
    types = { "italic", "bold" },
  },
})
vim.cmd.colorscheme("catppuccin")
