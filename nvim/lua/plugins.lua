local plugins = {
  "nvim-treesitter/nvim-treesitter",
  "terrortylor/nvim-comment",
  "folke/tokyonight.nvim",
  "norcalli/nvim-colorizer.lua",
  "onsails/lspkind.nvim",

  {
    "lukas-reineke/indent-blankline.nvim",
    main="ibl",
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
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
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'}
    }
  }
}

require('lazy').setup(plugins)
require('nvim_comment').setup()
require('ibl').setup{exclude={filetypes={"dashboard"},}}
require('colorizer').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "c", "cpp"},
  highlight = {enable = true}
}
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
require('mason').setup()
require('mason-lspconfig').setup({
  handlers = {lsp_zero.default_setup},
  ensure_installed = {"clangd"},
})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
require('cmp').setup {
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  window = {
    scrollbar = false,
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert({
    ['<S-CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}


require('tokyonight').setup({transparent=true})
vim.cmd("colorscheme tokyonight-night")
