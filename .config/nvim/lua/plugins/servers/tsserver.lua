return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.root_dir = opts.root_dir
				or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
			opts.sources = vim.list_extend(opts.sources or {}, {
				require("none-ls.diagnostics.eslint"),
				require("none-ls.formatting.eslint"),
				require("none-ls.code_actions.eslint"),
			})
		end,
	},
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	opts = {
	-- 		linters_by_ft = {
	-- 			javascript = { "eslint" },
	-- 			javascriptreact = { "eslint" },
	-- 			typescript = { "eslint" },
	-- 			typescriptreact = { "eslint" },
	-- 		},
	-- 	},
	-- },
	{
		"dmmulroy/tsc.nvim",
		opts = {
			run_as_monorepo = true,
			use_trouble_qflist = true,
		},
	},
}
