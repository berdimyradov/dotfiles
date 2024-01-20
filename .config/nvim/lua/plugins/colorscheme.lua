return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },

  -- add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
  },

  -- Configure LazyVim to load preffered theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
