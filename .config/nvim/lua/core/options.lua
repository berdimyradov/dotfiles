vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autoread = true
vim.opt.breakindent = true
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.fillchars:append({ eob = " " })
vim.opt.laststatus = 2
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"
vim.opt.sessionoptions = {
	"buffers",
	"curdir",
	"folds",
	"globals",
	"help",
	"tabpages",
	"winsize",
	"terminal",
	"localoptions",
}
vim.opt.statuscolumn = ""
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.wrap = true
