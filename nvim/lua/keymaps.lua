local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Navigate using the hjkl keys in insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>)", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Telescope keymaps
keymap("n", "<Leader>ff", ":Telescope find_files<Enter>", opts)
keymap("n", "<Leader>fw", ":Telescope live_grep<Enter>", opts)
keymap("n", "<Leader>gc", ":Telescope git_commits<Enter>", opts)
keymap("n", "<Leader>gs", ":Telescope git_status<Enter>", opts)
keymap("n", "<Leader>th", ":Telescope colorscheme<Enter>", opts)

-- Plugins
keymap("n", "<Leader>ct", ":ColorizerToggle<Enter>", opts)
keymap("n", "<Leader>db", ":Dashboard<Enter>", opts)
keymap("n", "<Leader>cc", ":CommentToggle<Enter>", opts)
