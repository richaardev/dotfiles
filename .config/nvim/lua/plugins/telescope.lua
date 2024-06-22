return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"Myzel394/jsonfly.nvim",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			version = "^1.0.0",
			config = function()
				require("telescope").load_extension("live_grep_args")
			end,
		},
	},
	keys = function()
		require("telescope").load_extension("jsonfly")
		local builtin = require("telescope.builtin")

		return {
			{ "<leader>ff", builtin.find_files, desc = "Find Files" },
			{ "<leader>fb", builtin.buffers, desc = "Find Buffers" },
			{ "<leader>fr", builtin.resume, desc = "Find Resume" },
			{ "<leader>fw", builtin.current_buffer_fuzzy_find, desc = "Current Buffer Fuzzy Find" },

			{ "<leader>fg", builtin.live_grep, desc = "Live Grep" },
			{ "<leader>fG", "<cmd>Telescope live_grep_args<cr>", desc = "Live Grep (Args)" },
			{
				"<leader>fj",
				"<cmd>Telescope jsonfly<cr>",
				desc = "Open json(fly)",
				ft = { "json", "xml", "yaml" },
				mode = "n",
			},
		}
	end,
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-a>"] = require("telescope.actions.layout").toggle_preview,
				},
			},
			preview = {
				hide_on_startup = true, -- hide previewer when picker starts
			},
			path_display = {
				shorten = { len = 6, exclude = { 2, -1 } },
			},
		},
	},
	-- config = function(_, opts)
	-- require("telescope").load_extension("jsonfly")
	-- 	require("telescope").setup(opts)
	-- end,
}
