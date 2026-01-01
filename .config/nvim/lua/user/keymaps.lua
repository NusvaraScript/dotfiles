local keymap = vim.keymap.set
-- Set which key
local wk = require("which-key")

wk.add({
    { "<leader>f", group = "Find/Telescope" },
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "LSP" },
    { "<leader>w", desc = "Save File" },
    { "<leader>e", desc = "Toggle Explorer" },
    { "<leader>x", desc = "Close Buffer" },
})

-- Set Space as your leader key
vim.g.mapleader = " "

-- File Explorer (Toggle with Space + e)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope (Find files with Space + ff)
keymap("n", "<leader>ff", ":Telescope find_files<CR>")
keymap("n", "<leader>fg", ":Telescope live_grep<CR>")

-- Easy window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Switch Tabs
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>")
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")

-- Toggle Sidebar with Space + e
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Focus to side when its open
keymap("n", "<leader>o", ":NvimTreeFocus<CR>")

-- Prettier (space + f to format the current buffer)
keymap("n", "<leader>f", function()
    require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end, { desc = "Format file" })

-- Gitsigns
local gs = require('gitsigns')

-- Jump to next/previous change (Hunk)
keymap("n", "]h", function()
    if vim.wo.diff then return ']h' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
end, { expr = true, desc = "Next Git hunk" })

keymap("n", "[h", function()
    if vim.wo.diff then return '[h' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
end, { expr = true, desc = "Prev Git hunk" })

-- Preview the change in a floating window (Like VS Code hover)
keymap("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Git hunk" })

-- Reset/Undo a specific change
keymap("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Git hunk" })

-- Clipboard
vim.opt.clipboard = "unnamedplus"
