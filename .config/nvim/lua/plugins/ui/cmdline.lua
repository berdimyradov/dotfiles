require("noice").setup({
	cmdline = {
		enabled = true,
		view = "cmdline_popup",
	},
	messages = {
		enabled = false,
	},
	popupmenu = {
		enabled = true,
	},
	presets = {
		command_palette = true,
	},
	views = {
		cmdline_popup = {
			position = { row = 1, col = "50%" },
			size = { width = 60, height = "auto" },
		},
		popupmenu = {
			relative = "editor",
			position = { row = 4, col = "50%" },
			size = { width = 60, height = 10 },
		},
	},
})
