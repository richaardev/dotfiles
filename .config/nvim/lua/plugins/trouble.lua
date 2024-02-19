return {
	"folke/trouble.nvim",
	enabled = vim.g.vscode == nil,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		require("core.utils").load_keymaps("trouble")
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
