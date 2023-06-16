
-- Status line
require('lualine').setup()

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme('jellybeans-nvim')

-- Basic text
vim.o.textwidth = 80
vim.wo.colorcolumn = '80'

vim.o.showbreak = '+++'

-- For git
vim.wo.signcolumn = 'yes'

-- Lazy redraw
vim.o.lazyredraw = true

-- Whitespace
vim.opt.list = true
vim.opt.listchars.tab = "▸"
vim.opt.listchars.trail = "⋅"
vim.opt.listchars.nbsp = "⋅"
