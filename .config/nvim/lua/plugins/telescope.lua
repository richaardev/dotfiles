return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<leader>fF", LazyVim.telescope("files"), desc = "Find Files (root dir)" },
		{ "<leader>ff", LazyVim.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },

		{ "<leader>bf", LazyVim.telescope("current_buffer_fuzzy_find"), desc = "Current Buffer Fuzzy Find (cwd)" },
	},
}
