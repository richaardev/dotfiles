return {
	{
		"nvimtools/none-ls.nvim",
		enabled = vim.g.vscode == nil,
		dependencies = {
			-- {
			-- 	"jay-babu/mason-null-ls.nvim",
			-- 	opts = function()
			-- 		return {
			-- 			ensure_installed = {
			-- 				"prettier",
			-- 				"eslint_d",
			-- 				"stylua",
			-- 			},
			--
			-- 			automatic_installation = true,
			-- 		}
			-- 	end,
			-- 	config = function(_, opts)
			-- 		require("mason-null-ls").setup(opts)
			-- 	end,
			-- },
		},
		init = function()
			local null_ls = {
				-- plugin = true,

				-- n = {
				-- 	["<leader>gf"] = { vim.lsp.buf.format, "Format document" },
				-- },
			}
			require("core.utils").load_keymaps(null_ls)
		end,
		opts = function()
			local null_ls = require("null-ls")
			local utils = require("null-ls.utils")

			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			local eslint_file_pattern = utils.root_pattern(
				"eslint.config.js",
				-- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
				".eslintrc",
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc.json",
				"package.json"
			)(vim.api.nvim_buf_get_name(0)) ~= nil

			local eslint_filetypes = {
				"javascript",
				"typescript",
				"typescriptreact",
				"javascriptreact",
				"vue",
				"html",
				"css",
			}

			return {
				sources = {
					formatting.stylua,
					formatting.eslint_d.with({
						filetypes = eslint_filetypes,
						condition = function()
							return eslint_file_pattern
						end,
					}),
					diagnostics.eslint_d.with({
						filetypes = eslint_filetypes,
						condition = function()
							return eslint_file_pattern
						end,
					}),
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
								vim.lsp.buf.format({ bufnr = bufnr })
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
