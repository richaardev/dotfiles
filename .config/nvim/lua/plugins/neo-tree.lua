return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = vim.g.vscode == nil,
	branch = "v3.x",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	init = function()
		local neotree = {
			{ "<C-n>", "<cmd>Neotree filesystem toggle<CR>", desc = "Toggle nneotree" },
		}
		require("utils").keymap.load_keymaps(neotree)
	end,
	opts = function()
		return {
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			popup_border_style = "rounded",
			window = {
				position = "float",
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
			},
		}
	end,
	config = function(_, opts)
		require("neo-tree").setup(opts)
	end,
}
