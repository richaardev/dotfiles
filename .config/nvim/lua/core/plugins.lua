local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Theme
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "rose-pine/neovim", as = "rose-pine" },

	-- NvimTree
	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-tree/nvim-web-devicons" },

	-- LuaLine
	{ "nvim-lualine/lualine.nvim" },
	{ "bluz71/vim-nightfly-colors" },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter" }, -- better highlight

	{ "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
	"windwp/nvim-autopairs",

	-- Terminal
	{ "akinsho/toggleterm.nvim" },

	-- File search
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Language Server Protocol
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },

	-- Completions
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ "saadparwaiz1/cmp_luasnip" },

	-- For lsp notifications
	{ "j-hui/fidget.nvim" },

	{ "numToStr/Comment.nvim" }, -- Better code comments
	{ "lukas-reineke/indent-blankline.nvim" }, -- indentation lines
}

local opts = {}

require("lazy").setup(plugins, opts)
