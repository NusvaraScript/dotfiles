return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- Menggunakan 'main' memberi tahu Lazy untuk menggunakan modul ini saat memanggil 'opts'
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "javascript",
            "lua",
            "vim",
            "vimdoc",
            "c",
            "query",
            "typescript", -- Tambahan untuk web dev
            "tsx",        -- Tambahan untuk React
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            -- Disarankan tetap false kecuali Anda punya masalah highlight spesifik
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            disable = { "python", "c" },
        },
    },
}
