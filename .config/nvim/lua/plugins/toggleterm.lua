return {
	"akinsho/toggleterm.nvim",
	enabled = vim.g.vscode == nil,
	opts = function()
		return {
			float_opts = {
				border = "curved",
			},
			direction = "float",
			-- size = 90,
			open_mapping = [[<M-t>]],
		}
	end,
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}
