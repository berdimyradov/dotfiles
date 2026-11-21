return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    styles = {
      notification = {
        focusable = false,
      },
    },

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

    -- dashboard = {
    --   enabled = false,
    --   preset = {
    --     header = "Welcome back",
    --   },
    --   sections = {
    --     { section = "header" },
    --     { section = "keys", gap = 1, padding = 1 },
    --     { section = "recent_files", limit = 5, padding = 1 },
    --     { section = "startup" },
    --   },
    -- },

    -- Picker
    -- picker = {
    --   layout = {
    --     preset = "ivy", -- options: "ivy", "dropdown", "vertical", "telescope"
    --     spacing = 0, -- Forces elements right next to each other
    --   },
    -- },
  },
}
