
-- Status line
require('lualine').setup()

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme('jellybeans-nvim')

-- Basic text
vim.o.textwidth = 120
vim.wo.colorcolumn = '120'
vim.opt.formatoptions:remove { "t", "c" }
vim.opt.formatoptions:append { "q", "l" }

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
