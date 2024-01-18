return {
	"lukas-reineke/indent-blankline.nvim",
	version = "2.20.7",
	enabled = vim.g.vscode == nil,
	-- init = function()
	-- 	require("core.utils").lazy_load("indent-blankline.nvim")
	-- end,
	opts = function()
		return {}
	end,
	config = function(_, opts)
		require("core.utils").load_mappings("blankline")
		require("indent_blankline").setup(opts)
	end,
}
