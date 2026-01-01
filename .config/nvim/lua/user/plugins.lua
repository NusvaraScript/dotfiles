local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Dashboard (Home Screen)
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },

    -- Colorscheme
    { "catppuccin/nvim",        name = "catppuccin", priority = 1000 },

    -- UI Improvements (Dressing & UI-Select)
    { 'stevearc/dressing.nvim', opts = {} },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown {} } }
            })
            require("telescope").load_extension("ui-select")
        end
    },

    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = { width = 30, side = "left" },
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = { enable = true, update_root = true },
            })
        end,
    },

    -- Navigation & Search
    { "nvim-telescope/telescope.nvim",   dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Status Line & Tabs
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = { theme = 'auto', globalstatus = true },
            })
        end
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require("bufferline").setup({}) end
    },
    { 'Bekaboo/dropbar.nvim',                opts = {} },

    -- LSP & Completion
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets", -- Snippets collection
        },
    },

    -- Coding Tools (Auto pairs, tags, comments, indent)
    { "windwp/nvim-ts-autotag",              opts = {} },
    { "windwp/nvim-autopairs",               opts = {} },
    { "numToStr/Comment.nvim",               opts = {} },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",                                        opts = {} },
    { "NvChad/nvim-colorizer.lua",           config = function() require('colorizer').setup() end },
    { "folke/todo-comments.nvim",            dependencies = { "nvim-lua/plenary.nvim" },          opts = {} },

    -- Git
    { "lewis6991/gitsigns.nvim",             opts = {} },

    -- Formatter
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    html = { "prettier" },
                    css = { "prettier" },
                    lua = { "stylua" },
                },
                format_on_save = { timeout_ms = 500, lsp_fallback = true },
            })
        end,
    },

    -- Utils
    { 'vyfor/cord.nvim', build = 'sh ./build', opts = {} },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern", -- Gunakan tampilan modern (jika pakai versi terbaru)
            spec = {
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>l", group = "LSP" },
            },
            win = {
                border = "rounded", -- Membuat jendela menu jadi bulat/estetik
            },
        },
    },
})
