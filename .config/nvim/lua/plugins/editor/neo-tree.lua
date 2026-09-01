return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 40,

        mappings = {
          ["z"] = "none",
          ["zM"] = "close_all_nodes",
          ["zR"] = "expand_all_nodes",
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
          ["c"] = "copy_to_clipboard",
          ["y"] = {
            function(state)
              local node = state.tree:get_node()
              local filename = vim.fn.fnamemodify(node.path, ":t")

              vim.fn.setreg("+", filename)
              vim.notify("Copied filename: " .. filename)
            end,
            desc = "Copy filename",
          },
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = vim.fn.fnamemodify(node.path, ":p")

              vim.fn.setreg("+", path)
              vim.notify("Copied full path: " .. path)
            end,
            desc = "Copy full path",
          },
        },
        position = "left",
        popup = {
          position = { row = "50%", col = "0%" },
          size = { height = "93%", width = "30%" },
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          visible = true,
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
