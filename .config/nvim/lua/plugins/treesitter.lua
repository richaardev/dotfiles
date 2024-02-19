return {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = vim.g.vscode == nil,
		version = false,
		build = ":TSUpdate",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<c-space>", desc = "[Treesitter] Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				enabled = vim.g.vscode == nil,
				opts = function()
					return {}
				end,
				config = function(_, opts) end,
			},
		},
		opts = function()
			return {
				ensure_installed = { "javascript", "typescript", "tsx", "go", "gomod", "lua", "rust" },
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				textobjects = {
					move = {
						enable = true,
						goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
						goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
						goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
						goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
					},
				},
			}
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		-- event = "LazyFile",
		opts = {},
	},
}
