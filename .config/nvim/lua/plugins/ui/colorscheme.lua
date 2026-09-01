return {
  -- Add the Catppuccin plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      -- custom_highlights = {},
      styles = {
        comments = { "italic" },
        keywords = { "bold" },
        types = { "italic", "bold" },
      },
    },
  },

  -- Catppuccin resolves its flavour from the standard 'background' option.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
}
