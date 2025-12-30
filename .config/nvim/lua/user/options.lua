local opt = vim.opt

opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Relative line numbers (great for jumping)
opt.mouse = "a"             -- Enable mouse support
opt.ignorecase = true       -- Ignore case in search
opt.smartcase = true        -- ...unless uppercase is used
opt.shiftwidth = 4          -- Size of an indent
opt.tabstop = 4             -- Number of spaces tabs count for
opt.expandtab = true        -- Convert tabs to spaces
opt.termguicolors = true    -- True color support
opt.cursorline = true       -- Highlight the current line
opt.clipboard = "unnamedplus" -- Use system clipboard
