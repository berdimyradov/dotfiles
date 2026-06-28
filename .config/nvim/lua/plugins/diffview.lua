return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", false, mode = "n" },
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },

    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      enhanced_diff_hl = true, -- Better diff highlighting

      -- Enables filetype icons in the Diffview panels (requires `nvim-web-devicons` or `mini.icons`)
      use_icons = true,
    },

    keys = {
      -- Simple toggle logic: closes if open, opens if closed
      {
        "<leader>gd",
        function()
          local lib = require("diffview.lib")
          local view = lib.get_current_view()

          if view then
            vim.cmd("DiffviewClose")
          else
            vim.cmd("DiffviewOpen")
          end
        end,
        desc = "Toggle Diffview",
      },

      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
    },
  },
}
