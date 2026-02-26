return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },

  -- add catppuccin
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     flavour = "dayfox",
  --   },
  -- },

  -- Add the nightfox plugin
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false, -- Set to true if you want your terminal bg to show through
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        }
      })
    end,
  },


  -- Configure LazyVim to load preffered theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dayfox",
    },
  },
}
