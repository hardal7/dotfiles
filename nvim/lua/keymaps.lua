local keymap = vim.api.nvim_set_keymap
local opts = { silent = true }

vim.g.mapleader = " "

-- Navigate using the hjkl keys in insert mode
-- keymap("i", "<C-h>", "<Left>", opts)
-- keymap("i", "<C-j>", "<Down>)", opts)
-- keymap("i", "<C-k>", "<Up>", opts)
-- keymap("i", "<C-l>", "<Right>", opts)

-- Telescope
keymap("n", "<C-s>", ":Telescope find_files<Enter>", opts)
keymap("n", "<C-w>", ":Telescope live_grep<Enter>", opts)

-- Neotree
keymap("n", "<C-d>", ":NvimTreeToggle<Enter>", opts)

-- LSP
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Plugins
keymap("n", "<C-a>", ":Dashboard<Enter>", opts)
keymap("n", "<C-c>", ":CommentToggle<Enter>", opts)
keymap("n", "<Tab>", ":BufferNext<Enter>", opts)
keymap("n", "<S-Tab>", ":BufferPrevious<Enter>", opts)
