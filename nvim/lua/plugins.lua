local plugins = {
  "nvim-treesitter/nvim-treesitter",
  "terrortylor/nvim-comment",
  "folke/tokyonight.nvim",
  "norcalli/nvim-colorizer.lua",
  "lewis6991/gitsigns.nvim",

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
			    {desc = ' Quit', group = '@macro', action = 'q!', key = 'q'}
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
      {'L3MON4D3/LuaSnip'},
      {"onsails/lspkind.nvim"},
    }
  }
}

require('lazy').setup(plugins)
require('nvim_comment').setup()
require('ibl').setup{exclude={filetypes={"dashboard"},}}
require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  current_line_blame = true,
  current_line_blame_opts = {delay = 500}
}
require('colorizer').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "c", "cpp", "lua"},
  highlight = {enable = true}
}
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
require('mason').setup()
require('mason-lspconfig').setup({
  handlers = {lsp_zero.default_setup},
  ensure_installed = {"clangd", "bashls", "lua_ls"},

})

local cmp = require('cmp')
local cmp_mappings = {
    ['<S-CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {"i", "s",}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {"i","s"})
};

cmp_mappings['<Up>'] = vim.NIL
cmp_mappings['<Down>'] = vim.NIL

cmp.setup({
  window = {completion = {scrollbar = false}},  
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  mapping = cmp_mappings
})


require('tokyonight').setup({transparent=true})
vim.cmd("colorscheme tokyonight-night")
