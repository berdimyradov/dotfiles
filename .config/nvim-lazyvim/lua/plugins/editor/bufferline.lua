-- opts = function(_, opts)
--   opts.numbers = "both"
--   opts.indicator_icon = ">>>>>> "
-- end,

return {
  {
    "akinsho/bufferline.nvim",
    -- auto-session restores on VimEnter, before LazyVim's default VeryLazy
    -- event. Load bufferline during startup so its SessionLoadPost callback
    -- is registered in time to restore pinned buffers.
    lazy = false,
    opts = {
      options = {
        -- numbers = "both",
        always_show_bufferline = true,
      },
    },
  },
}
