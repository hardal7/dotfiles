local plugins = {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  {
    "terrortylor/nvim-comment"
  },

  {
    --"EdenEast/nightfox.nvim"
    --"Shatur/neovim-ayu"
    "folke/tokyonight.nvim"
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main="ibl",
  },

  {
    "nvim-telescope/telescope.nvim", 
    tag='0.1.4',
    dependencies = {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons'}
  },

  {
    "nvimdev/dashboard-nvim",
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {config={
        footer={
          "                               ",
          "You are what you repeatedly do."}, 
        header={
          "     ██╗  ██╗ █████╗ ██████╗ ██████╗  █████╗ ██╗     ",     
          "     ██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║     ",  
          "     ███████║███████║██████╔╝██║  ██║███████║██║     ",    
          "     ██╔══██║██╔══██║██╔══██╗██║  ██║██╔══██║██║     ",
          "     ██║  ██║██║  ██║██║  ██║██████╔╝██║  ██║███████╗",
          "     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝",
          "                                                     "},
        shortcut = {
          {desc = '󰊳 Update', group = '@string', action = 'Lazy sync', key = 'u' },
          {desc = ' Dotfiles', group = '@property', action = 'Telescope find_files cwd=~/.config', key = 'd'},
          {desc = '󰈔 New file', group = '@string', action = 'enew', key = 'n'},
    			{desc = '   Mason ', group = '@property', action = 'Mason', key = 'm'},
			    {desc = '  Quit', group = '@macro', action = 'q!', key = 'q'}
        },
        project = { enable = false}
      }
    }
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
  },

  {
    "williamboman/mason.nvim",
    opts = {ensure_installed={"clangd,clang-format"}}
  },
}

require('lazy').setup(plugins)
require('mason').setup()
require('nvim_comment').setup()
require('ibl').setup{exclude={filetypes={"dashboard"},}}
require('colorizer').setup()
require("tokyonight").setup({transparent=true})
vim.cmd("colorscheme tokyonight-night")
