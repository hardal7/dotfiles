local plugins = {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  {
    "navarasu/onedark.nvim",
    lazy = false
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main="ibl"
  },

  {
    'nvim-telescope/telescope.nvim', tag='0.1.4',
    dependencies = {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons'}
  },

  {
    "norcalli/nvim-colorizer.lua",
  },

  {
    "williamboman/mason.nvim"
  },
}

require('lazy').setup(plugins)
require('mason').setup()
require('ibl').setup()
require('colorizer').setup()
require('onedark').setup {
  colors = {bg0="#0d0d15"}
}
require('onedark').load()
