return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", false, mode = "n" },
    },
  },

  {
    -- Maintained fork. Unlike the archived original, this preserves the
    -- file-tree's collapsed state when staging refreshes the panel.
    "dlyongemallo/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    opts = {
      enhanced_diff_hl = true,
      use_icons = true,

      file_panel = {
        win_config = {
          position = "left",
          width = 50, -- Default is 35
        },
      },

      view = {
        default = {
          layout = "diff2_horizontal",
        },
        file_history = {
          layout = "diff2_horizontal",
        },
        cycle_layouts = {
          default = { "diff2_horizontal", "diff2_vertical" },
        },
      },
    },
    keys = {
      {
        "<leader>gd",
        function()
          -- Force lazy.nvim to properly load the plugin and apply 'opts' if not yet loaded
          if not package.loaded["diffview"] then
            require("lazy").load({ plugins = { "diffview.nvim" } })
          end

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
