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
    -- see https://htmlcolorcodes.com/colors/shades-of-${color}/
    local colors = {
      red = {
        default = "#FF0000",

        maroon = "#800000",
        pastel = "#FAA0A0",
        venetian = "#A42A04",
      },

      orange = {
        default = "#FFA500",

        amber = "#FFBF00",
        bright = "#FFAC1C",
        neon = "#FF5F1F",
        pastel = "#FAC898",
      },

      green = {
        default = "#008000",

        cadmium = "#097969",
        celadon = "#AFE1AF",
        forest = "#228B22",
        pastel = "#C1E1C1",
        seafoam = "#9FE2BF",
        shamrock = "#009E60",
      },

      blue = {
        default = "#0000FF",

        denim = "#6F8FAF",
        navy = "#000080",
        neon = "#1F51FF",
        pastel = "#A7C7E7",
      },
    }

    local palettes = {
      carbonfox = {
        unstaged = {
          add = "#25be6a",
          change = "#f1c40f",
          delete = "#ff5c57",
          untracked = "#7aa2f7",
        },
        staged = {
          add = "#6a8f72",
          change = "#9a8f5f",
          delete = "#9a6666",
          untracked = "#5f6f8f",
        },
      },

      dayfox = {
        unstaged = {
          add = colors.green.forest,
          change = colors.orange.neon,
          delete = colors.red.venetian,
          untracked = colors.blue.navy,
        },
        staged = {
          add = colors.green.pastel,
          change = colors.orange.pastel,
          delete = colors.red.pastel,
          untracked = colors.blue.pastel,
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
