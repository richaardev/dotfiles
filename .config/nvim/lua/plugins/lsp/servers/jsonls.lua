return {
	{
		"b0o/schemastore.nvim",
		lazy = true,
		version = false,
	},
	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			opts.servers = opts.servers or {}
			opts.servers.jsonls = opts.servers.jsonls or {}
			table.insert(opts.servers.jsonls, {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						format = { enable = true },
						validate = { enable = true },
					},
				},
			})
		end,
	},
}
