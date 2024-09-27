require("config.lazy")


require('java').setup()
require('lspconfig').jdtls.setup({})
-- Set colorscheme after options
vim.cmd('colorscheme flexoki-dark')
vim.opt.termguicolors = true
vim.notify = require("notify")
vim.opt.fillchars = { eob = " " }
vim.opt.list = true
vim.opt.relativenumber = true

local wk = require("which-key")

wk.add(require("config.keybinds"))

vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
