return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}

      --
      -- Never Show
      --
      local never_show = opts.filesystem.filtered_items.never_show or {}
      local never = {
        [".git"] = true,
        [".DS_Store"] = true,
      }

      for _, name in ipairs(never_show) do
        never[name] = true
      end

      opts.filesystem.filtered_items.never_show = {}
      for name, _ in pairs(never) do
        table.insert(opts.filesystem.filtered_items.never_show, name)
      end
      table.sort(opts.filesystem.filtered_items.never_show)

      --
      -- Always Show
      --
      local always_show = opts.filesystem.filtered_items.always_show or {}
      local always = { [".gitignore"] = true }
      for _, name in ipairs(always_show) do
        always[name] = true
      end
      opts.filesystem.filtered_items.always_show = {}
      for name, _ in pairs(always) do
        table.insert(opts.filesystem.filtered_items.always_show, name)
      end
      table.sort(opts.filesystem.filtered_items.always_show)
    end,
  },
}
