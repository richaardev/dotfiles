return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	init = function()
		require("core.utils").load_mappings("neotree")
	end,
	opts = function()
		return {
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			window = {
				position = "left",
			},
		}
	end,
	config = function(_, opts)
		require("neo-tree").setup(opts)
	end,
}
