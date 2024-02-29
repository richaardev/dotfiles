local M = {}

M.general = {
	{ "<leader>cl", "<cmd>Lazy<cr>", mode = "n", desc = "Lazy" },

	{ "<C-b>", "<ESC>^i", mode = "i", desc = "Beginning of line" },
	{ "<C-e>", "<End>", mode = "i", desc = "End of line" },

	{ "<Esc>", "<cmd> noh <CR>", desc = "Clear highlights" },

	-- Add new undo point
	{ ".", ".<c-g>u", mode = "i", desc = "Add new undo point" },
	{ ",", ",<c-g>u", mode = "i", desc = "Add new undo point" },
	{ ";", ";<c-g>u", mode = "i", desc = "Add new undo point" },

	-- Buffer actions
	{ "L", "<cmd>bnext<cr>", mode = "n", desc = "Next buffer" },
	{ "H", "<cmd>bprevious<cr>", mode = "n", desc = "Next buffer" },

	-- Tab Actions
	{ "[b", "<cmd>bprevious<cr>", mode = "n", desc = "Next buffer" },
	{ "[b", "<cmd>bprevious<cr>", mode = "n", desc = "Next buffer" },

	-- move lines
	{ "<M-k>", "<cmd>m .-2<cr>==", desc = "Move up", mode = "n" },
	{ "<M-j>", "<cmd>m .+1<cr>==", desc = "Move down", mode = "n" },
	{ "<M-j>", ":m '>+1<CR>gv=gv", desc = "Move down", mode = "v" },
	{ "<M-k>", ":m '<-2<CR>gv=gv", desc = "Move up", mode = "v" },
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
			-- vim.lsp.buf.format()
			require("utils").format({ force = true })
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

return M
