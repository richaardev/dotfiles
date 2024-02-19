return {
	{
		"williamboman/mason.nvim",
		enabled = vim.g.vscode == nil,
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = function(t)
			return {
				ensure_installed = {
					"lua-language-server",
					"typescript-language-server",
					"gopls",
					"tailwindcss-language-server",
				},
			}
		end,
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")

			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end

			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		enabled = vim.g.vscode == nil,
		opts = function(t)
			return {}
		end,
		-- config = function(_, opts)
		-- 	-- require("mason-lspconfig").setup(opts)
		-- end,
	},

	{
		"neovim/nvim-lspconfig",
		enabled = vim.g.vscode == nil,
		dependencies = {
			-- { "folke/neodev.nvim", opts = {} },
		},
		config = function()
			-- require("neodev").setup()
			local utils = require("core.utils")
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			local on_attach = function(client, bufnr)
				-- client.server_capabilities.documentFormattingProvider = false
				-- client.server_capabilities.documentRangeFormattingProvider = false

				utils.load_keymaps("lspconfig", { buffer = bufnr })
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			function ConfigureServer(name, language_options)
				language_options.on_attach = on_attach
				language_options.capabilities = capabilities

				lspconfig[name].setup(language_options)
			end

			ConfigureServer("tsserver", {})
			ConfigureServer("bashls", {})

			ConfigureServer("gopls", {
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

			ConfigureServer("lua_ls", {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- diagnostics = {
						-- 	globals = { "vim" },
						-- },
						-- workspace = {
						-- 	library = {
						-- 		[vim.fn.expand("$vimruntime/lua")] = true,
						-- 		[vim.fn.expand("$vimruntime/lua/vim/lsp")] = true,
						-- 		[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
						-- 	},
						-- 	maxpreload = 100000,
						-- 	preloadfilesize = 10000,
						-- },
					},
				},
			})

			ConfigureServer("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {},
				},
			})

			--    require("plugins.lsp.lspconfig")
			-- require("plugins.lsp.servers")
		end,
	},

	-- load luasnips + cmp related in insert mode only
}
