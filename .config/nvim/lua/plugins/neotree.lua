return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		close_if_last_window = true,
		window = {
			-- position = "float",
			position = "left",
			mappings = {
				["Y"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.setreg("+", path, "c")
					end,
					desc = "copy path to clipboard",
				},
			},
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_by_name = {
					".git",
				},
			},
			use_libuv_file_watcher = true,
		},
	},
	keys = {
		-- { "<leader>e",  }
	},
}
