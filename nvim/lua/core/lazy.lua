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
    {
      "vhyrro/luarocks.nvim",
      priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
      config = true,
    }, -- So lazy can load other lua requirements
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
    {'nvim-telescope/telescope-fzy-native.nvim'},
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
    -- Avante
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
    {
        "yetone/avante.nvim",
        build = "make",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
            ---@module 'avante'
            ---@type avante.Config
            opts = {
                provider = "claude",
                providers = {
                    claude = {
                        endpoint = "https://api.anthropic.com",
                        model = "claude-sonnet-4-20250514",
                        timeout = 30000, -- Timeout in milliseconds
                            extra_request_body = {
                                temperature = 0.75,
                                max_tokens = 20480,
                            },
                    },
                },
            },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            {
                -- Make sure to set this up properly if you have lazy=true
                    'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
})
require('gitsigns').setup()
