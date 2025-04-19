local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Navigate using the hjkl keys in insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>)", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Telescope keymaps
keymap("n", "<C-f>", ":Telescope find_files<Enter>", opts)
keymap("n", "<C-w>", ":Telescope live_grep<Enter>", opts)
keymap("n", "<C-g>", ":Telescope git_commits<Enter>", opts)
keymap("n", "<C-s>", ":Telescope git_status<Enter>", opts)
keymap("n", "<Leader>th", ":Telescope colorscheme<Enter>", opts)

-- Plugins
keymap("n", "<Leader>ct", ":ColorizerToggle<Enter>", opts)
keymap("n", "<C-d>", ":Dashboard<Enter>", opts)
keymap("n", "<C-c>", ":CommentToggle<Enter>", opts)
keymap("n", "<Tab>", ":BufferNext<Enter>", opts)
keymap("n", "<S-Tab>", ":BufferPrevious<Enter>", opts)
keymap("n", "<C-x>", ":bdelete<Enter>", opts)

