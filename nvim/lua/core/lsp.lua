-- LSP settings.

-- Setup language servers.
vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391', 'E303'},
          maxLineLength = 80
        }
      }
    }
  }
})
vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {},
    }
})
vim.lsp.config('lua_ls', {})

-- vim.lsp.config() only stores settings; servers must also be enabled.
vim.lsp.enable({ 'pylsp', 'rust_analyzer', 'lua_ls', 'ts_ls' })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- ([d / ]d to jump between diagnostics are built-in defaults)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Built-in LSP autocompletion (pops up as you type)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        -- Buffer local mappings.
        -- Neovim provides these by default (see :help lsp-defaults):
        --   K    hover           grn  rename
        --   gri  implementation  gra  code action
        --   grr  references      grt  type definition
        --   gO   document symbols  <C-s> (insert) signature help
        --   <C-]> definition (via tagfunc)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>F', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
