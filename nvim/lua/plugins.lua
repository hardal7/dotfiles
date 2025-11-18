local plugins = {
	"nvim-treesitter/nvim-treesitter",
	"nvim-tree/nvim-tree.lua",
	"onsails/lspkind.nvim",
	"lewis6991/gitsigns.nvim",
	"terrortylor/nvim-comment",
	"OXY2DEV/markview.nvim",
	"norcalli/nvim-colorizer.lua",
	"nvim-telescope/telescope.nvim",
	"nvim-tree/nvim-web-devicons",
	"Dich0tomy/oxocarbon-lua.nvim",
	"stevearc/conform.nvim",
	"nvimdev/dashboard-nvim",

	{
		"airblade/vim-rooter",
		Lazy = false,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
		},
	},

	{
		"azratul/live-share.nvim",
		dependencies = {
			"jbyuki/instant.nvim",
		},
		config = function()
			vim.g.instant_username = "hardal"
		end,
	},

	{
		"wakatime/vim-wakatime",
		lazy = false,
		setup = function()
			vim.cmd([[packadd wakatime/vim-wakatime]])
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {
			transparent_bg = true,
			transparent_cursorline = true,
		},
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false })
		end,
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "lukas-reineke/cmp-under-comparator" },
		},
	},
}

-- Plugin Configurations
require("lazy").setup(plugins)

require("nvim_comment").setup()

require("ibl").setup({ exclude = { filetypes = { "dashboard" } } })

require("tiny-inline-diagnostic").setup({
	signs = {
		diag = " ",
	},
	blend = { factor = 0 },
	hi = {
		background = "None",
	},
})

require("conform").setup({
	formatters_by_ft = {
		clangd = { "clang-format" },
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("telescope").setup({
	defaults = {
		layout_config = {
			vertical = { width = 0.2 },
		},
	},
})

require("gitsigns").setup({
	signcolumn = false,
	current_line_blame = true,
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"dockerfile",
		"glsl",
		"make",
		"objdump",
		"sql",
		"go",
		"ruby",
		"lua",
		"python",
		"html",
		"css",
		"javascript",
		"markdown_inline",
	},
	highlight = { enable = true },
})

require("dashboard").setup({
	config = {
		footer = {
			"                               ",
			"You are what you repeatedly do.",
		},
		header = {
			"           __..--''``---....___   _..._    __          ",
			"/// //_.-'    .-/\";  `        ``<._  ``.''_ `. / // / ",
			"///_.-' _..--.'_    \\                    `( ) ) // // ",
			"/ (_..-' // (< _     ;_..__               ; `' / ///   ",
			"/ // // //  `-._,_)' // / ``--...____..-' /// /  //    ",
			"                                                       ",
		},
		shortcut = {
			{ desc = "󰊳 Update", group = "@string", action = "Lazy sync", key = "u" },
			{ desc = " Dotfiles", group = "@property", action = "Telescope find_files cwd=~/.config", key = "d" },
			{ desc = "󰈔 New file", group = "@string", action = "enew", key = "n" },
			{ desc = "   Mason ", group = "@property", action = "Mason", key = "m" },
			{ desc = "  Quit", group = "@macro", action = "q!", key = "q" },
		},
		project = { enable = true },
	},
})

require("nvim-tree").setup({
	filters = { custom = { "^\\.git$" } },
})
local api = require("nvim-tree.api")
local Event = api.events.Event
api.events.subscribe(Event.TreeOpen, function()
	api.tree.expand_all()
end)

local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup()
require("mason-lspconfig").setup({
	handlers = { lsp_zero.default_setup },
	ensure_installed = { "clangd", "bashls", "html", "dockerls", "gopls", "pylsp", "lua_ls", "stylua" },
	settings = { gopls = { completeUnimported = true } },
})

local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "text",
			symbol_map = {
				Text = "  ",
				Method = "  ",
				Function = "  ",
				Constructor = "  ",
				Field = "  ",
				Variable = "  ",
				Class = "  ",
				Interface = "  ",
				Module = "  ",
				Property = "  ",
				Unit = "  ",
				Value = "  ",
				Enum = "  ",
				Keyword = "  ",
				Snippet = "󰐱  ",
				Color = "  ",
				File = "  ",
				Reference = "  ",
				Folder = "  ",
				EnumMember = "  ",
				Constant = "  ",
				Struct = "  ",
				Event = "  ",
				Operator = "  ",
				TypeParameter = "  ",
			},
			maxwidth = {
				menu = 20,
				abbr = 50,
			},
			ellipsis_char = "...",
			show_labelDetails = true,
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
})

require("cmp").setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim-cmp" },
	},
	window = {
		completion = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None", -- Styling
			scrollbar = false,
		},
	},
	mapping = cmp.mapping.preset.insert({
		["<C-a>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-c>"] = cmp.mapping.close(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
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
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
})

local dap = require("dap")
require("dap-go").setup()
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}
dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = {}, -- provide arguments if needed
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
	{
		name = "Select and attach to process",
		type = "gdb",
		request = "attach",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		pid = function()
			local name = vim.fn.input("Executable name (filter): ")
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = "${workspaceFolder}",
	},
	{
		name = "Attach to gdbserver :1234",
		type = "gdb",
		request = "attach",
		target = "localhost:1234",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}
dap.configurations.cpp = dap.configurations.c
