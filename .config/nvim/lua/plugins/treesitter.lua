return {
	"nvim-treesitter/nvim-treesitter",
	opts = function()
		return {
			ensure_installed = { "javascript", "typescript", "tsx", "go", "gomod", "lua", "rust" },

			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = {
				enable = true,
			},
		}
	end,
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
