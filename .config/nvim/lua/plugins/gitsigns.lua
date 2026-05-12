return {
  "lewis6991/gitsigns.nvim",

  opts = function(_, opts)
    opts.signs_staged_enable = true

    -- Unstaged hunks
    opts.signs = vim.tbl_deep_extend("force", opts.signs or {}, {
      add = { text = "┃", hl = "GitSignsAdd" },
      change = { text = "┃", hl = "GitSignsChange" },
      delete = { text = "_", hl = "GitSignsDelete" },
      topdelete = { text = "‾", hl = "GitSignsDelete" },
      changedelete = { text = "~", hl = "GitSignsChange" },
      untracked = { text = "┆", hl = "GitSignsUntracked" },
    })

    -- Staged hunks
    opts.signs_staged = vim.tbl_deep_extend("force", opts.signs_staged or {}, {
      add = { text = "┃", hl = "GitSignsStagedAdd" },
      change = { text = "┃", hl = "GitSignsStagedChange" },
      delete = { text = "_", hl = "GitSignsStagedDelete" },
      topdelete = { text = "‾", hl = "GitSignsStagedDelete" },
      changedelete = { text = "~", hl = "GitSignsStagedChange" },
      untracked = { text = "┆", hl = "GitSignsStagedUntracked" },
    })

    return opts
  end,

  init = function()
    local palettes = {
      carbonfox = {
        unstaged = {
          add = "#25BE6A",
          change = "#F1C40F",
          delete = "#FF5C57",
          untracked = "#7AA2F7",
        },
        staged = {
          add = "#6A8F72",
          change = "#9A8F5F",
          delete = "#9A6666",
          untracked = "#5F6F8F",
        },
      },

      dayfox = {
        unstaged = {
          add = "#287A3E",
          change = "#9A6700",
          delete = "#B42318",
          untracked = "#005A9C",
        },
        staged = {
          add = "#5E7A64",
          change = "#8A7840",
          delete = "#8A5A5A",
          untracked = "#5A6F8A",
        },
      },
    }

    local function get_palette()
      local colorscheme = vim.g.colors_name or ""

      if colorscheme == "dayfox" then
        return palettes.dayfox
      end

      if colorscheme == "carbonfox" then
        return palettes.carbonfox
      end

      -- fallback for other themes
      return palettes.carbonfox
    end

    local function set_gitsigns_hl()
      local p = get_palette()

      -- Unstaged hunks
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = p.unstaged.add, bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = p.unstaged.change, bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = p.unstaged.delete, bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = p.unstaged.untracked, bg = "NONE" })

      -- Staged hunks
      vim.api.nvim_set_hl(0, "GitSignsStagedAdd", { fg = p.staged.add, bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsStagedChange", { fg = p.staged.change, bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsStagedDelete", { fg = p.staged.delete, bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsStagedUntracked", { fg = p.staged.untracked, bg = "NONE" })

      -- Optional: keep gutter background clean
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "NONE" })
    end

    set_gitsigns_hl()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_gitsigns_hl,
    })
  end,
}
