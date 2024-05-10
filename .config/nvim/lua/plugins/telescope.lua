return {
	"nvim-telescope/telescope.nvim",
	keys = function()
		local builtin = require("telescope.builtin")

		return {
			{ "<leader>ff", builtin.find_files, desc = "Find Files" },
			{ "<leader>fb", builtin.buffers, desc = "Find Buffers" },
			{ "<leader>fr", builtin.resume, desc = "Find Resume" },
			{ "<leader>fw", builtin.current_buffer_fuzzy_find, desc = "Current Buffer Fuzzy Find" },

			{ "<leader>sg", builtin.live_grep, desc = "Live Grep" },
		}
	end,
}
