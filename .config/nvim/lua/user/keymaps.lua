local keymap = vim.keymap.set

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
