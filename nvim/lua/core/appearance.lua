
-- Status line
require('lualine').setup()

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme('jellybeans-nvim')

-- Basic text
vim.o.textwidth = 80
vim.wo.colorcolumn = '80'
-- Don't auto-wrap code/comments at textwidth (string args; tables silently
-- fail for flag options).
vim.opt.formatoptions:remove('tc')
vim.opt.formatoptions:append('ql')

vim.o.showbreak = '+++'

-- For git
vim.wo.signcolumn = 'yes'

-- Whitespace
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '⋅', nbsp = '⋅' }

-- Spelling
vim.o.spell = false
vim.g.spelunker_check_comments = 1

