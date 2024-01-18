local lspconfig = require("lspconfig")
---@diagnostic disable-next-line: different-requires
local options = require("plugins.config.lsp.lspconfig")
local util = require("lspconfig/util")

lspconfig.gopls.setup({
	on_attach = options.on_attach,
	capabilities = options.capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

lspconfig.tsserver.setup({
	on_attach = options.on_attach,
	capabilities = options.capabilities,
})

lspconfig.rust_analyzer.setup({
	on_attach = options.on_attach,
	capabilities = options.capabilities,
	settings = {
		["rust-analyzer"] = {},
	},
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
