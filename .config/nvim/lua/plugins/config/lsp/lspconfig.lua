local lspconfig = require("lspconfig")

local utils = require("core.utils")

local on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	utils.load_mappings("lspconfig", { buffer = bufnr })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local options = {
	on_attach = on_attach,
	capabilities = capabilities,
}

lspconfig.tsserver.setup({
	on_attach = options.on_attach,
	capabilities = options.capabilities,
})

lspconfig.lua_ls.setup({
	on_attach = options.on_attach,
	capabilities = options.capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

return options
