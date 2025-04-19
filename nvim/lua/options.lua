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
opt.showmode = false
opt.laststatus = 0
opt.ruler = false
vim.wo.fillchars='eob: '

opt.signcolumn = 'no'

-- Search settings
opt.incsearch = true
opt.ignorecase = true
opt.hlsearch = false

vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})

-- Hide errors
vim.diagnostic.config({
  virtual_text = false,
})
