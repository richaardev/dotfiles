return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tailwindcss = {
					single_file_support = false,
					-- filetypes = { "typescriptreact", "javascriptreact", "html" },
					root_dir = function(fname)
						local lsputil = require("lspconfig/util")
						return lsputil.root_pattern(
							"tailwind.config.js",
							"tailwind.config.ts",
							"tailwind.config.cjs",
							"tailwind.js",
							"tailwind.ts",
							"tailwind.cjs"
						)(fname)
					end,
					settings = {
						tailwindCSS = {
							validate = true,
							lint = {
								cssConflict = "warning",
								invalidApply = "error",
								invalidScreen = "error",
								invalidVariant = "error",
								invalidConfigPath = "error",
								invalidTailwindDirective = "error",
								recommendedVariantOrder = "warning",
							},
							experimental = {
								classRegex = {
									-- [[class= "([^"]*)]],
									-- [[class: "([^"]*)]],
									-- '~H""".*class="([^"]*)".*"""',
									-- '~F""".*class="([^"]*)".*"""',
									--
									{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
									{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
									{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
								},
							},
						},
					},
				},
			},
		},
	},
}
