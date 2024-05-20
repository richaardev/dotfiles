return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			version = "^1.0.0",
			config = function()
				require("telescope").load_extension("live_grep_args")
			end,
		},
	},
	keys = function()
		local builtin = require("telescope.builtin")

		return {
			{ "<leader>ff", builtin.find_files, desc = "Find Files" },
			{ "<leader>fb", builtin.buffers, desc = "Find Buffers" },
			{ "<leader>fr", builtin.resume, desc = "Find Resume" },
			{ "<leader>fw", builtin.current_buffer_fuzzy_find, desc = "Current Buffer Fuzzy Find" },

			{ "<leader>sg", builtin.live_grep, desc = "Live Grep" },
			{ "<leader>sG", "<cmd>Telescope live_grep_args<cr>", desc = "Live Grep (Args)" },
		}
	end,
}
