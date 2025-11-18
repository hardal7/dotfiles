-- Telescope Transparency
vim.g.oxocarbon_lua_transparent = true
vim.g.oxocarbon_lua_alternative_telescope = true

-- NvimTree Transparency
vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=none guifg=#9da5b3")

vim.cmd("colorscheme oxocarbon-lua")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
