return {
	"folke/noice.nvim",
	enabled = true,
	opts = {
		cmdline = {
			enabled = false,
		},
		messages = {
			enabled = false,
		},
		notify = {
			enabled = false,
		},
		popupmenu = {
			enabled = false,
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		views = {
			mini = {
				position = {
					row = -2,
				},
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
		},
	},
}
