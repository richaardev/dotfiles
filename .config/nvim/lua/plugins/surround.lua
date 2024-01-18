return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	opts = function()
		return {}
	end,
	config = function(_, opts)
		require("nvim-surround").setup(opts)
	end,
}
