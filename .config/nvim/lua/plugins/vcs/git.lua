require("gitsigns").setup({
  signs_staged_enable = true,
  on_attach = function(buffer)
    local gitsigns = require("gitsigns")
    local maps = {
      { "<leader>hs", gitsigns.stage_hunk, "Stage hunk" },
      { "<leader>hr", gitsigns.reset_hunk, "Reset hunk" },
      { "<leader>hS", gitsigns.stage_buffer, "Stage buffer" },
      { "<leader>hu", gitsigns.undo_stage_hunk, "Undo stage hunk" },
      { "<leader>hR", gitsigns.reset_buffer, "Reset buffer" },
      { "<leader>hp", gitsigns.preview_hunk, "Preview hunk" },
      { "<leader>hb", gitsigns.blame_line, "Blame line" },
    }
    for _, map in ipairs(maps) do
      vim.keymap.set("n", map[1], map[2], { buffer = buffer, desc = map[3] })
    end
    vim.keymap.set("n", "]c", function()
      gitsigns.nav_hunk("next")
    end, { buffer = buffer, desc = "Next Git hunk" })
    vim.keymap.set("n", "[c", function()
      gitsigns.nav_hunk("prev")
    end, { buffer = buffer, desc = "Previous Git hunk" })
  end,
})
