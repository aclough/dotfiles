local lazy = {}

function lazy.install(path)
    if not vim.loop.fs_stat(path) then
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
lazy.opts = {}

lazy.setup({
    {'kamykn/spelunker.vim'}, -- Spelling
    {'tpope/vim-fugitive'},
    {'airblade/vim-rooter'}, -- set CWD based on .git or other clues
    {'lewis6991/gitsigns.nvim',
        event = {"BufReadPre", "BufNewFile"},
    },
    {'metalelf0/jellybeans-nvim', dependencies = {'rktjmp/lush.nvim'}},
    {'nvim-lualine/lualine.nvim'}, -- Status line
    {'Yggdroot/indentLine'}, -- Display indentation
    {'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
    {'ggandor/leap.nvim',
        dependencies = {"tpope/vim-repeat"},
        config = function(_, opts)
            local leap = require("leap")
            leap.add_default_mappings(true)
        end,
    },
    {'alaviss/nim.nvim'}, -- starts in folds but provides syntax highlighting


    -- Git integration (gitsigns.nvim?)
    -- Yank ring? bfredl/nvim-miniyank
    -- Lint engine works with lualine?
    -- surround.vim?

    -- LSP stuff config in lsp.lua
    {'neovim/nvim-lspconfig'},
})
require('gitsigns').setup()
