return {
	"akinsho/toggleterm.nvim",
	enabled = vim.g.vscode == nil,
	opts = function()
		return {
			float_opts = {
				border = "curved",
			},
		}
	end,
}
