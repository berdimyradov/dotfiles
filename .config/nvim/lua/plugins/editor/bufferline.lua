require("bufferline").setup({
	options = {
		-- numbers = "both",
		always_show_bufferline = true,
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})
