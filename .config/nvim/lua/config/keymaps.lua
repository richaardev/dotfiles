local M = {}

vim.keymap.del("i", "<M-k>")
vim.keymap.del("i", "<M-j>")

M.general = {
	-- { "<leader>cl", "<cmd>Lazy<cr>", mode = "n", desc = "Lazy" },

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
	{ "K", "<cmd>m .-2<cr>==", desc = "Move up", mode = "n" },
	{ "J", "<cmd>m .+1<cr>==", desc = "Move down", mode = "n" },
	{ "K", ":m '<-2<CR>gv=gv", desc = "Move up", mode = "v" },
	{ "J", ":m '>+1<CR>gv=gv", desc = "Move down", mode = "v" },
	{ "<", "<gv", mode = "v", desc = "Indent line" },
	{ ">", ">gv", mode = "v", desc = "Indent line" },
}

local util = require("utils")

util.keymap.load_keymaps(M.general)
