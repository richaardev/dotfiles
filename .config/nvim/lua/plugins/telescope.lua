return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = vim.g.vscode == nil,
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			require("core.utils").load_mappings("telescope")
		end,
		opts = function()
			local actions = require("telescope.actions")

			return {
				defaults = {
					file_ignore_patterns = { "node_modules" },
					path_display = { "truncate" },

					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-_>"] = actions.which_key,
						},
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
		end,
	},
	{ "BurntSushi/ripgrep" },
}
