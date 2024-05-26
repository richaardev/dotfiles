return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<CMD>Oil<CR>", "Open parent directory", mode = "n" },
	},
	opts = {
		win_options = {
			winbar = "%{v:lua.require('oil').get_current_dir()}",
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
