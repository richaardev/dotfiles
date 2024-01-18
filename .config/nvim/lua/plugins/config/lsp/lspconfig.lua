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

return options
