return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<leader>fF", LazyVim.telescope("files"), desc = "Find Files (root dir)" },
		{ "<leader>ff", LazyVim.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
	},
}
