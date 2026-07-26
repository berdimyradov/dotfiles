return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 40,

        mappings = {
          ["z"] = "none",
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
