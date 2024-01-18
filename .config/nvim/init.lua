require("core")
require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	require("core.bootstrap").lazy(lazypath)
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
	{ import = "plugins" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		init = function()
			vim.cmd("colorscheme tokyonight-storm")
		end,
	},
})

if vim.g.vscode then
	print("Hello VSCode!!!")
end
