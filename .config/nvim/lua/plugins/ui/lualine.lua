-- Default configuration - https://github.com/nvim-lualine/lualine.nvim#default-configuration
-- see also defaults for nvim/lua/config/ui.lua - https://www.lazyvim.org/plugins/ui
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        -- lualine_a = { "mode" },
        -- lualine_b = { "branch" },
        -- lualine_c = { "" },
        -- lualine_x = {
        --   "encoding",
        --   "fileformat",
        --   "filetype",
        -- },
        -- lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
