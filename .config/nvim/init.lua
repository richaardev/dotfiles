local core = require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	require("core.bootstrap").lazy(lazypath)
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.lsp" },

		{
			"folke/tokyonight.nvim",
			lazy = true,
			opts = { style = "moon" },
			init = function()
				require("tokyonight").load()
				vim.cmd.colorscheme("tokyonight")
			end,
		},
	},

	change_detection = {
		enable = false,
		notify = false,
	},
})

core.setup()
