return {
	"windwp/nvim-ts-autotag",
	enabled = vim.g.vscode == nil,
	opts = {},
	config = function()
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
		})
	end,
}
