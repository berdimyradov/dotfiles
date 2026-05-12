return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  config = true,

  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    enhanced_diff_hl = true, -- Better diff highlighting

    -- Enables filetype icons in the Diffview panels (requires `nvim-web-devicons` or `mini.icons`)
    use_icons = true,
  },

  keys = {
    -- { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    -- Simple toggle logic: closes if open, opens if closed
    {
      "<leader>gd",
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd("DiffviewOpen")
        else
          vim.cmd("DiffviewClose")
        end
      end,
      desc = "Toggle Diffview",
    },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
  },
}
