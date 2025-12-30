-- 1. Setup Mason to manage your server installations
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" }
})

-- 2. Define your global capabilities (for autocompletion)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 3. Define what happens when a server attaches to a file
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end,
})

-- 4. Enable the servers using the NEW Neovim 0.11+ syntax
-- This replaces the old .setup() calls
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } }
        }
    }
})

-- Finally, tell Neovim to actually start the server
vim.lsp.enable('lua_ls')
