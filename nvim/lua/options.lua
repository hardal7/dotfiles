local opt = vim.opt

-- Save file state
opt.undofile = true

-- Colors
opt.termguicolors = true

-- Indent settings
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Hide bottom bar
opt.showmode = false
opt.laststatus = 0
opt.ruler = false
vim.wo.fillchars='eob: '

-- Search settings
opt.incsearch = true
opt.ignorecase = true
opt.hlsearch = false

