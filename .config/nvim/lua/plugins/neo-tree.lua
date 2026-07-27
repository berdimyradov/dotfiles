return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 40,

        mappings = {
          ["z"] = "none",
          -- TODO: Consider dedicated position mappings:
          -- <leader>pf = float, <leader>pr = right, <leader>pl = left.
          ["<leader>p"] = {
            function(state)
              local command = require("neo-tree.command")
              local position = state.current_position == "float" and "left" or "float"

              command.execute({
                action = "close",
                source = state.name,
              })

              command.execute({
                action = "focus",
                source = state.name,
                position = position,
              })
            end,
            desc = "Toggle float/left position",
          },
        },

        position = "float",
        popup = {
          position = { row = "50%", col = "0%" },
          size = { height = "93%", width = "30%" },
        },
      },
      filesystem = {
        filtered_items = {
          never_show = {
            ".DS_Store",
            ".git",
          },
          always_show = {
            ".gitignore",
          },
        },
      },
    },
  },
}
