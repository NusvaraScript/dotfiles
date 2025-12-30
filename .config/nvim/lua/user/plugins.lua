local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
    })
    end
    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
        -- Colorscheme (The "Look")
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

        -- File Explorer (The sidebar)
        { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

        -- Bottom Status Line
        { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

        -- Fuzzy Finder (Search files like Ctrl+P)
        { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

        -- Syntax Highlighting
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

        -- LSP Support
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "hrsh7th/cmp-nvim-lsp", -- Integration with completion
            },
        },

        -- Autocompletion (The "IntelliSense" popup)
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "L3MON4D3/LuaSnip", -- Snippet engine
                "saadparwaiz1/cmp_luasnip",
            },
        },

        {
            'akinsho/bufferline.nvim',
            version = "*",
            dependencies = 'nvim-tree/nvim-web-devicons',
            config = function()
            require("bufferline").setup({})
            end
        },
    })
