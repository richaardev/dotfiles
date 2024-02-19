return {
	"folke/which-key.nvim",
	enabled = vim.g.vscode == nil,
	keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
	init = function()
		require("core.utils").load_keymaps("whichkey")
	end,
	cmd = "WhichKey",
	config = function(_, opts)
		require("which-key").setup(opts)
	end,
}
