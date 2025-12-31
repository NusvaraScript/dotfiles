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
    -- Colorscheme (The "Look")
    { "catppuccin/nvim",                 name = "catppuccin",                             priority = 1000 },

    -- File Explorer (The sidebar)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },

    -- Bottom Status Line
    { "nvim-lualine/lualine.nvim",       dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- Fuzzy Finder (Search files like Ctrl+P)
    { "nvim-telescope/telescope.nvim",   dependencies = { "nvim-lua/plenary.nvim" } },

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

    -- Discord Activiy
    {
        'vyfor/cord.nvim',
        build = 'sh ./build',
        event = 'VeryLazy',
        opts = {
            display = {
                theme = 'catppuccin', -- Theme
                show_time = true,
                show_repository = true,
            },
            lsp = {
                show_problem_count = true, -- Shows how much errors on Discord
            },
        },
    },

    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30,
                    side = "left",
                },
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
            })
        end,
    },

    -- Auto-tag and Auto-pair
    { "windwp/nvim-ts-autotag",    config = function() require('nvim-ts-autotag').setup() end },
    { "windwp/nvim-autopairs",     config = function() require('nvim-autopairs').setup() end },

    -- Colorizer (CSS/Tailwind)
    { "NvChad/nvim-colorizer.lua", config = function() require('colorizer').setup() end },

    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs                   = {
                    add          = { text = '┃' },
                    change       = { text = '┃' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signcolumn              = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl                   = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir            = {
                    interval = 1000,
                    follow_files = true
                },
                attach_to_untracked     = true,
                current_line_blame      = true, -- Shows who committed the line (like GitLens)
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 500,
                },
            })
        end,
    },

    -- Prettier
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    svelte = { "prettier" },
                    css = { "prettier" },
                    html = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    lua = { "stylua" }, -- Recommended for your Neovim config files
                },
                -- This is the "VS Code style" auto-save feature
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                },
            })
        end,
    },

    -- Lualigns
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'auto', -- Automatically matches your colorscheme
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    globalstatus = true, -- One statusline for all windows (Modern look)
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { { 'filename', path = 1 } }, -- Shows relative path
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
            })
        end
    },

    -- Dropbar breadcrumbs
    {
        'Bekaboo/dropbar.nvim',
        -- No dependencies needed for basic functionality
        config = function()
            require('dropbar').setup({
                -- Optional: You can customize icons or behavior here
            })
        end
    },

    -- Whichkey Plugins
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300 -- Popup shows up after 300ms
        end,
        opts = {
            -- You can leave this empty for the default settings
        },
    },
})
