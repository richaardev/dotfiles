return {
	"nvim-lualine/lualine.nvim",
	enabled = vim.g.vscode == nil,
  event = {"VeryLazy"},
	opts = function()
		return {
			options = {
				icons_enabled = true,
				-- theme = "catppuccin-macchiato",
				component_separators = "|",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					"neo-tree",
				},
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "branch" },
				lualine_c = { "buffers" },
				lualine_x = { "tabs", "diff" },
				lualine_y = { "diagnostics", "fileformat", "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		}
	end,
}
