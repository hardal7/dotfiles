local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

local plugins = {
  "nvim-treesitter/nvim-treesitter",
  "terrortylor/nvim-comment",
  "Dich0tomy/oxocarbon-lua.nvim",
  "onsails/lspkind.nvim",
  "lewis6991/gitsigns.nvim",
  "airblade/vim-rooter",
  --"nvim-lualine/lualine.nvim",

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
          "           __..--''``---....___   _..._    __          ",
          "/// //_.-'    .-/\";  `        ``<._  ``.''_ `. / // / ",
          "///_.-' _..--.'_    \\                    `( ) ) // // ",
          "/ (_..-' // (< _     ;_..__               ; `' / ///   ",
          "/ // // //  `-._,_)' // / ``--...____..-' /// /  //    ",
          "                                                       "},
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
  },
}

require('lazy').setup(plugins)
require('nvim_comment').setup()
require('ibl').setup{exclude={filetypes={"dashboard"},}}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "c", "cpp", "dockerfile", "glsl", "make", "objdump", "sql", "go", "ruby", "lua", "python", "html", "css", "javascript"},
  highlight = {enable = true}
}
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
require('mason').setup()
require('mason-lspconfig').setup({
  handlers = {lsp_zero.default_setup},
  ensure_installed = {"clangd", "bashls", "cssls", "html", "dockerls", "gopls", "pylsp", "lua_ls"},
  -- settings = { gopls = {completeUnimported = true }}
})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' },  -- LSP source
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      return vim_item
    end,
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  window = {
    completion = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',  -- Styling
      scrollbar = false,
    },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-a>'] = cmp.mapping.confirm({select = false}),
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
}

require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.2 }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  -- other configuration values here
})

-- require('lualine').setup({
    -- sections = {
        -- lualine_x = {
            -- 'filetype'
        -- }
    -- }
-- })

-- Gitsigns with line blames on and column signs hidden
require('gitsigns').setup {
  signcolumn = false,
  current_line_blame = true,
}

-- Oxocarbon colorscheme with transparency and alternative telescope theme
vim.g.oxocarbon_lua_transparent = true
vim.g.oxocarbon_lua_alternative_telescope = true
vim.cmd.colorscheme 'oxocarbon-lua'
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
