return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Enable the image viewer component
    image = {
      formats = { "png", "jpg", "jpeg", "gif", "bmp", "webp" },
      doc = {
        enabled = true, -- Renders inline images in markdown/hover docs
        inline = false, -- Set to true if you prefer inline text replacement
        float = true, -- Shows image in a floating window on hover
        max_width = 60,
        max_height = 30,
      },
    },

    -- Picker
    -- picker = {
    --   layout = {
    --     preset = "ivy", -- options: "ivy", "dropdown", "vertical", "telescope"
    --     spacing = 0, -- Forces elements right next to each other
    --   },
    -- },
  },
}
