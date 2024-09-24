require("config.lazy")

-- Set colorscheme after options
vim.cmd('colorscheme flexoki-dark')
vim.opt.termguicolors = true
vim.notify = require("notify")

vim.opt.fillchars = { eob = " " }

local wk = require("which-key") 

wk.add({
	{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Tree View", mode = 'n' }, -- File explorer
	{ "<leader>l", group = "Lazy Plugin Manager"},
	{ "<leader>li", "<cmd>Lazy install<cr>", desc = "Install"}
})


