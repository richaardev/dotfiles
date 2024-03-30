return {
	"folke/trouble.nvim",
	enabled = vim.g.vscode == nil,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		local trouble = {
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

		require("utils").keymap.load_keymaps(trouble)
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
