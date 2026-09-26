local lazy = {}

function lazy.install(path)
    if not vim.uv.fs_stat(path) then
        print('Installing lazy.nvim....')
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable', -- latest stable release
            path,
        })
    end
end

function lazy.setup(plugins)
    -- You can "comment out" the line below after lazy.nvim is installed
    lazy.install(lazy.path)

    vim.opt.rtp:prepend(lazy.path)
    require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
-- Lazy resets the runtimepath to just $VIMRUNTIME and the config dir. On
-- Debian/Ubuntu the bundled treesitter parsers (vimdoc, lua, etc.) live in a
-- separate arch-specific dir (e.g. /usr/lib/x86_64-linux-gnu/nvim), so keep
-- any default rtp entry that contains a parser/ directory.
local parser_paths = {}
for _, dir in ipairs(vim.api.nvim_list_runtime_paths()) do
    if vim.uv.fs_stat(dir .. '/parser') and dir ~= vim.env.VIMRUNTIME then
        table.insert(parser_paths, dir)
    end
end
lazy.opts = {
    performance = { rtp = { paths = parser_paths } },
}

lazy.setup({
    {'kamykn/spelunker.vim'}, -- Spelling
    {'tpope/vim-fugitive'},
    {'airblade/vim-rooter'}, -- set CWD based on .git or other clues
    {'lewis6991/gitsigns.nvim',
        event = {"BufReadPre", "BufNewFile"},
        opts = {}, -- lazy calls setup() when the event fires
    },
    {'metalelf0/jellybeans-nvim', dependencies = {'rktjmp/lush.nvim'}},
    {'nvim-lualine/lualine.nvim'}, -- Status line
    {'Yggdroot/indentLine'}, -- Display indentation
    {'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
    {'nvim-telescope/telescope-fzy-native.nvim'},
    {'https://codeberg.org/andyg/leap.nvim',}, -- Fast movement
    {'alaviss/nim.nvim'}, -- Starts in folds but provides syntax highlighting


    -- Git integration (gitsigns.nvim?)
    -- Yank ring? bfredl/nvim-miniyank
    -- Lint engine works with lualine?
    -- surround.vim?

    -- LSP stuff config in lsp.lua
    {'neovim/nvim-lspconfig'},
})

vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')


