vim.opt.mouse = 'a' -- Turn on mouse

if vim.env.WAYLAND_DISPLAY then
    vim.g.clipboard = {
      name = 'wl-clipboard',
      copy = {
        ['+'] = 'wl-copy',
        ['*'] = 'wl-copy',
      },
      paste = {
        ['+'] = 'wl-paste',
        ['*'] = 'wl-paste',
      },
      cache_enabled = 0,
    }
end
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard by default

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.scrolloff = 5

-- Buffers/Tabs/Windows
vim.o.hidden = true

-- ==================================================
-- Keybindings
-- ==================================================
vim.g.mapleader = " "
-- Simple function to set keys non-recursively
local function map_key(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Cycle through split windows
map_key('n', '<C-J>', '<C-w>w')
map_key('n', '<C-K>', '<C-w>W')

-- Cycle through tabs
map_key('n', '<C-H>', 'gT')
map_key('n', '<C-L>', 'gt')

-- Q repeats last macro
map_key('n', 'Q', '@@')

-- Y should behave like other capitals
map_key('n', 'Y', 'y$')

-- Remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

require('core/lazy')

require('core/appearance')
require('core/lsp')
require('core/telescope')
