return {
	"nvim-lualine/lualine.nvim",
	enabled = vim.g.vscode == nil,
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
				lualine_b = { "filename", "branch" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = {},
				lualine_y = { "fileformat", "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		}
	end,
}
