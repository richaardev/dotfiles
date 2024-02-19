local M = {}

M.general = {
	{ "<leader>cl", "<cmd>Lazy<cr>", mode = "n", desc = "Lazy" },

	{ "<C-b>", "<ESC>^i", mode = "i", desc = "Beginning of line" },
	{ "<C-e>", "<End>", mode = "i", desc = "End of line" },

	{ "<Esc>", "<cmd> noh <CR>", desc = "Clear highlights" },

	-- move lines
	{ "<A-j>", "<esc><cmd>m .+1<cr>==gi", desc = "Move down", mode = "i" },
	{ "<A-k>", "<esc><cmd>m .-2<cr>==gi", desc = "Move up", mode = "i" },
	{ "<A-j>", "<cmd>m .+1<cr>==gi", desc = "Move down", mode = "n" },
	{ "<A-k>", "<cmd>m .-2<cr>==gi", desc = "Move up", mode = "n" },
	{ "<A-j>", ":m '>+1<CR>gv=gv", desc = "Move down", mode = "v" },
	{ "<A-k>", ":m '<-2<CR>gv=gv", desc = "Move up", mode = "v" },
	{ "<", "<gv", mode = "v", desc = "Indent line" },
	{ ">", ">gv", mode = "v", desc = "Indent line" },
}

M.comment = {

	-- toggle comment in both modes
	{
		"<leader>/",
		function()
			require("Comment.api").toggle.linewise.current()
		end,
		desc = "[Comment] Toggle comment",
	},

	{
		"<leader>/",
		"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
		mode = "v",
		desc = "[Comment] Toggle comment",
	},
}

M.lspconfig = {

	{
		"<leader>cf",
		function()
			vim.lsp.buf.format()
		end,
		desc = "[LSP] Code Format",
	},
	{
		"gD",
		function()
			vim.lsp.buf.declaration()
		end,
		desc = "[LSP] Go to declaration",
	},

	{
		"gd",
		function()
			vim.lsp.buf.definition()
		end,
		desc = "[LSP] Go to definition",
	},

	{
		"K",
		function()
			vim.lsp.buf.hover()
		end,
		desc = "[LSP] Hover element",
	},

	{
		"gi",
		function()
			vim.lsp.buf.implementation()
		end,
		desc = "[LSP] Go to implementation",
	},

	{
		"<leader>ls",
		function()
			vim.lsp.buf.signature_help()
		end,
		desc = "[LSP] Get signature help",
	},

	{
		"<leader>D",
		function()
			vim.lsp.buf.type_definition()
		end,
		desc = "[LSP] Get definition help",
	},

	{
		"<leader>ra",
		function()
			vim.lsp.buf.rename()
		end,
		desc = "[LSP] Rename element",
	},

	{
		"<leader>ca",
		function()
			vim.lsp.buf.code_action()
		end,
		mode = { "n", "v" },
		desc = "[LSP] Code Actions",
	},

	{
		"<leader>cA",
		function()
			vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } })
		end,
		desc = "[LSP] Source Actions",
	},

	{
		"gr",
		function()
			vim.lsp.buf.references()
		end,
		desc = "[LSP] Get references",
	},

	{
		"<leader>lf",
		function()
			vim.diagnostic.open_float({ border = "rounded" })
		end,
		desc = "[LSP] Floating diagnostic",
	},

	{
		"<leader>gdp",
		function()
			vim.diagnostic.goto_prev({ float = { border = "rounded" } })
		end,
		desc = "[LSP] Goto prev diagnostic",
	},

	{
		"<leader>gdn",
		function()
			vim.diagnostic.goto_next({ float = { border = "rounded" } })
		end,
		desc = "[LSP] Goto next diagnostic",
	},

	{
		"<leader>q",
		function()
			vim.diagnostic.setloclist()
		end,
		desc = "[LSP] Diagnostic setloclist",
	},

	{
		"<leader>wa",
		function()
			vim.lsp.buf.add_workspace_folder()
		end,
		desc = "[LSP] Add workspace folder",
	},

	{
		"<leader>wr",
		function()
			vim.lsp.buf.remove_workspace_folder()
		end,
		desc = "[LSP] Remove workspace folder",
	},

	{
		"<leader>wl",
		function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end,
		desc = "[LSP] List workspace folders",
	},
}

M.telescope = {

	-- find
	{ "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "[Telescope] Help page" },
	{ "<leader>fo", "<cmd> Telescope oldfiles <CR>", desc = "[Telescope] Find oldfiles" },
	{ "<leader>ff", "<cmd> Telescope find_files <CR>", desc = "[Telescope] Find files" },
	{
		"<leader>fa",
		"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
		desc = "[Telescope] Find all",
	},
	{ "<leader>fg", "<cmd> Telescope live_grep <CR>", desc = "[Telescope] Live grep" },
	{ "<leader>fb", "<cmd> Telescope buffers <CR>", desc = "[Telescope] Find buffers" },
	{ "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", desc = "[Telescope] Find in current buffer" },

	-- LSP
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

M.whichkey = {

	{
		"<leader>wK",
		function()
			vim.cmd("WhichKey")
		end,
		desc = "[WhichKey] Get all keymaps",
	},
	{
		"<leader>wk",
		function()
			local input = vim.fn.input("WhichKey: ")
			vim.cmd("WhichKey " .. input)
		end,
		desc = "[WhichKey] Query lookup",
	},
}

M.blankline = {

	{
		"<leader>cc",
		function()
			local ok, start = require("indent_blankline.utils").get_current_context(
				vim.g.indent_blankline_context_patterns,
				vim.g.indent_blankline_use_treesitter_scope
			)

			if ok then
				vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
				vim.cmd([[normal! _]])
			end
		end,

		desc = "[IndentBlankline] Jump to current context",
	},
}

M.trouble = {
	{
		"<leader>xx",
		function()
			require("trouble").toggle()
		end,
		desc = "[Trouble] Toggle trouble",
	},
	{
		"<leader>xw",
		function()
			require("trouble").toggle("workspace_diagnostics")
		end,
		desc = "[Trouble] Open workspace diagnostics",
	},
	{
		"<leader>xd",
		function()
			require("trouble").toggle("document_diagnostics")
		end,
		desc = "[Trouble] Open document diagnostics",
	},
	{
		"<leader>xq",
		function()
			require("trouble").toggle("quickfix")
		end,
		desc = "[Trouble] Open quick fix",
	},
	{
		"<leader>xl",
		function()
			require("trouble").toggle("loclist")
		end,
		desc = "[Trouble] Open loc list",
	},
}

return M
