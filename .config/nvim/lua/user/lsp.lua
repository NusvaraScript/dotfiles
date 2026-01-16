-- 1. Setup Mason (Hanya untuk manage instalasi binary)
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "ts_ls", "tailwindcss", "html", "cssls", "intelephense"
    }
})

-- 2. Capabilities untuk Autocompletion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 3. Global Keymaps (Otomatis aktif saat LSP connect)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local opts = { buffer = args.buf, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end,
})

-- 4. Konfigurasi Server (Format Baru 0.11+)
-- Kita buat daftar server agar kode lebih pendek dan rapi
local servers = {
    lua_ls = {
        settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
    },
    ts_ls = {},
    tailwindcss = {},
    cssls = {},
    html = {
        -- Gabungkan HTML dengan Blade & PHP agar auto-complete jalan di Laravel
        filetypes = { "html", "php", "blade" }
    },
    intelephense = {
        root_markers = { "composer.json", ".git", "index.php" },
        settings = {
            intelephense = {
                files = { maxSize = 5000000 },
            },
        },
    }
}

-- Loop untuk mendaftarkan dan mengaktifkan semua server secara otomatis
for server_name, config in pairs(servers) do
    config.capabilities = capabilities
    vim.lsp.config(server_name, config)
    vim.lsp.enable(server_name)
end
