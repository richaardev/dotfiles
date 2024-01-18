return {
	{
		"nvimtools/none-ls.nvim",
		enabled = vim.g.vscode == nil,
		dependencies = {
			{
				"jay-babu/mason-null-ls.nvim",
				opts = function()
					return {
						ensure_installed = {
							"prettier",
							"eslint_d",
							"stylua",
						},

						automatic_installation = true,
					}
				end,
				config = function(_, opts)
					require("mason-null-ls").setup(opts)
				end,
			},
		},
		init = function()
			require("core.utils").load_mappings("null_ls")
		end,
		opts = function()
			local null_ls = require("null-ls")

			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			return {
				sources = {
					formatting.stylua,
					formatting.eslint_d,
					diagnostics.eslint_d,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
								-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			}
		end,
		config = function(_, opts)
			require("null-ls").setup(opts)
		end,
	},
}
