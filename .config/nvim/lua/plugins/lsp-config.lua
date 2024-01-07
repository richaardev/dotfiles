return {
	{
		"williamboman/mason.nvim",
		opts = function(t)
			return {}
		end,
		config = function(_, opts)
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(t)
			return {
				ensure_installed = { "lua_ls", "tsserver" },
			}
		end,
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		init = function()
			require("core.utils").lazy_load("nvim-lspconfig")
		end,
		config = function()
			require("plugins.config.lsp.lspconfig")
		end,
	},

	-- load luasnips + cmp related in insert mode only
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},

			-- cmp sources plugins
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		opts = function()
			return require("plugins.config.lsp.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
}
