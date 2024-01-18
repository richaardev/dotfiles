return {
	"nvim-lualine/lualine.nvim",
	enabled = vim.g.vscode == nil,
	opts = function()
		return {
			options = {
				icons_enabled = true,
				theme = "onedark",
				component_separators = "|",
				section_separators = "",
				always_divide_middle = true,
				disabled_filetypes = {
					"neo-tree",
				},
			},
			sections = {
				lualine_c = {
					{
						"buffers",
					},
				},
			},
		}
	end,
}
