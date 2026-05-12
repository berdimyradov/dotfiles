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
      colorscheme = "dayfox",
    },
  },
}
