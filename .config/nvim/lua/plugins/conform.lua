return {
	"stevearc/conform.nvim",
	-- enabled = false,
	opts = {
		format = {
			timeout_ms = 7000,
		},
		formatters_by_ft = {
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
		},
	},
}
