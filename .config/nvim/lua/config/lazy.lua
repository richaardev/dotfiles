local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local fn = vim.fn

local function echo(str)
	vim.cmd("redraw")
	vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

local function shell_call(args)
	local output = fn.system(args)
	assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

local function install(install_path)
	echo("  Installing lazy.nvim & plugins ...")
	local repo = "https://github.com/folke/lazy.nvim.git"
	shell_call({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, install_path })
	vim.opt.rtp:prepend(install_path)
end

if not vim.loop.fs_stat(lazypath) then
	install(lazypath)
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
	spec = {
		{
			"LazyVim/Lazyvim",
			import = "lazyvim.plugins",
			opts = {
				defaults = {
					-- autocmds = true,
					-- keymaps = false,
				},
			},
		},

		{ import = "lazyvim.plugins.extras.vscode" },

		{ import = "lazyvim.plugins.extras.lsp.none-ls" },

		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.tailwind" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.go" },
		{ import = "lazyvim.plugins.extras.lang.docker" },
		{ import = "lazyvim.plugins.extras.lang.rust" },

		-- { import = "lazyvim.plugins.extras.editor.outline" },

		{ import = "lazyvim.plugins.extras.util.project" },

		{ import = "plugins" },
		{ import = "plugins.servers" },

		{
			"kawre/leetcode.nvim",
			build = ":TSUpdate html",
			dependencies = {
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim", -- required by telescope
				"MunifTanjim/nui.nvim",

				-- optional
				"nvim-treesitter/nvim-treesitter",
				"rcarriga/nvim-notify",
				"nvim-tree/nvim-web-devicons",
			},
			opts = {
				-- configuration goes here
			},
		},
	},

	defaults = {
		lazy = false,
		version = false,
	},
	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = { enabled = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	change_detection = {
		enable = false,
		notify = false,
	},
})
