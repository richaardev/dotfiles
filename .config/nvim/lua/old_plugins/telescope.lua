return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = vim.g.vscode == nil,
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
		init = function()
			local telescope = {

				-- find
				{ "<leader>ff", "<cmd> Telescope find_files <CR>", desc = "[Telescope] Find files" },
				{ "<leader>fr", "<cmd> Telescope resume <CR>", desc = "[Telescope] Resume" },
				{ "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "[Telescope] Help page" },
				{ "<leader>fo", "<cmd> Telescope oldfiles <CR>", desc = "[Telescope] Find oldfiles" },
				{
					"<leader>fa",
					"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
					desc = "[Telescope] Find all",
				},
				{ "<leader>fg", "<cmd> Telescope live_grep <CR>", desc = "[Telescope] Live grep" },
				{ "<leader>fb", "<cmd> Telescope buffers <CR>", desc = "[Telescope] Find buffers" },
				{
					"<leader>fz",
					"<cmd> Telescope current_buffer_fuzzy_find <CR>",
					desc = "[Telescope] Find in current buffer",
				},

				-- LSP
				{
					"<leader>fS",
					"<cmd> Telescope lsp_workspace_symbols <CR>",
					desc = "[Telescope] Find Symbols (Workspace)",
				},
				{
					"<leader>fs",
					"<cmd> Telescope lsp_document_symbols <CR>",
					desc = "[Telescope] Find Symbols (Current File)",
				},

				-- ["<leader>fr"] = { "<cmd> Telescope lsp_references <CR>", "[Telescope] Find References (LSP)" },
				-- ["<leader>fd"] = {
				-- 	"<cmd> Telescope lsp_document_diagnostics <CR>",
				-- 	"[Telescope] Find Document Diagnostics (LSP)",
				-- },
				-- ["<leader>fwd"] = {
				-- 	"<cmd> Telescope lsp_workspace_diagnostics <CR>",
				-- 	"[Telescope] Find Workspace Diagnostics (LSP)",
				-- },
			}

			require("utils").keymap.load_keymaps(telescope)
		end,
		opts = function()
			local actions = require("telescope.actions")

			return {
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
				pickers = {
					buffers = {
						mappings = {
							i = {
								["<c-c>"] = actions.delete_buffer + actions.move_to_top,
							},
						},
					},
				},
				defaults = {
					vimgrep_arguments = {
						"rg",
						"-L",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--trim",
					},
					prompt_prefix = " ",
					file_ignore_patterns = { "node_modules" },
					path_display = { "truncate" },

					mappings = {
						i = {
							["<esc>"] = actions.close,

							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,

							["<C-_>"] = actions.which_key, -- WTF it is <C-/>
							["<C-c>"] = false, -- Clear input
						},
					},
				},
			}
		end,
		config = function(_, opts)
			local function flash(prompt_bufnr)
				require("flash").jump({
					pattern = "^",
					label = { after = { 0, 0 } },
					search = {
						mode = "search",
						exclude = {
							function(win)
								return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
							end,
						},
					},
					action = function(match)
						local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
						picker:set_selection(match.pos[1] - 1)
					end,
				})
			end
			opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
				mappings = {
					n = { s = flash },
					i = { ["<c-s>"] = flash },
				},
			})
			local telescope = require("telescope")
			telescope.load_extension("fzf")
			telescope.setup(opts)
		end,
	},
	{ "BurntSushi/ripgrep" },
}
