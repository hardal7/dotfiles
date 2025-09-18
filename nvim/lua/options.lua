local opt = vim.opt

-- Save file, clipboard, change directory
opt.undofile = true
opt.clipboard = "unnamedplus"
opt.autochdir = true

-- Colors
opt.termguicolors = true

-- Indent settings
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Hide bottom and left bar
opt.signcolumn = 'no'
opt.laststatus = 0
opt.ruler = false
vim.wo.fillchars='eob: '
vim.wo.relativenumber = true

-- Search settings
opt.incsearch = true
opt.ignorecase = true
opt.hlsearch = false

vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})

-- Show errors
vim.diagnostic.config({
  virtual_text = true,
})
