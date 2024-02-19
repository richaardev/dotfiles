return {
	{ "echasnovski/mini.ai", version = "*" },
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end,
	},

	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<leader>bd",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
      -- stylua: ignore
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
		},
	},

	--comments
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		enabled = vim.g.vscode == nil,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{ "<leader>ft", "<cmd> TodoTelescope <CR>", desc = "[TodoComments] Todo" },
		},
	},
}
-- return {
-- 	"kylechui/nvim-surround",
-- 	version = "*", -- Use for stability; omit to use `main` branch for the latest features
-- 	event = "VeryLazy",
-- 	opts = function()
-- 		return {}
-- 	end,
-- 	config = function(_, opts)
-- 		require("nvim-surround").setup(opts)
-- 	end,
-- }
