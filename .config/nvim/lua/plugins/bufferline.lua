-- opts = function(_, opts)
--   opts.numbers = "both"
--   opts.indicator_icon = ">>>>>> "
-- end,

return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      numbers = "both",
      indicator_icon = ">>>>>> ",
      offsets = { { text = "foobar me", padding = 2 } },
    },
  },
}
