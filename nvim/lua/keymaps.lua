local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Navigate using the hjkl keys in insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down)", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Move line up & down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Telescope keymaps
keymap("n", "<Leader>ff", ":Telescope find_files<Enter>", opts)
keymap("n", "<Leader>fw", ":Telescope live_grep<Enter>", opts)
keymap("n", "<Leader>gc", ":Telescope git_commits<Enter>", opts)
keymap("n", "<Leader>gs", ":Telescope git_status<Enter>", opts)

-- Colorizer
keymap("n", "<Leader>ct", ":ColorizerToggle<Enter>", opts)
