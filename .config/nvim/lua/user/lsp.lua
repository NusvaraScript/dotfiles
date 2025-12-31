-- 1. Setup Mason for installation management
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "tailwindcss", "html", "cssls" }
})

-- 2. Define global capabilities for autocompletion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 3. Define keymaps when a server connects
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end,
})

-- 4. Configure servers using the NEW vim.lsp.config
-- This replaces lspconfig.server.setup()

-- Lua
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } }
        }
    }
})

-- TypeScript / JavaScript
vim.lsp.config('ts_ls', { capabilities = capabilities })

-- Tailwind CSS
vim.lsp.config('tailwindcss', { capabilities = capabilities })

-- HTML & CSS
vim.lsp.config('html', { capabilities = capabilities })
vim.lsp.config('cssls', { capabilities = capabilities })

-- 5. Enable the servers (This actually starts them)
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
