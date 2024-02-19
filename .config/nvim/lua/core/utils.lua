local M = {}
local merge_tb = vim.tbl_deep_extend

M.load_keymap = function(keymap, mapping_opt)
	if type(keymap) ~= "table" then
		return
	end

	function load_map(mode, keybind, action, options)
		local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})

		local opts = merge_tb("force", default_opts, options or {})

		opts.mode = nil
		opts.desc = options.desc
		vim.keymap.set(mode, keybind, action, opts)
	end

	local keybind = keymap[1]
	local func = keymap[2]
	local mode = keymap.mode
	local desc = keymap.desc
	local opts = keymap.opts or {}

	-- make normal mode default
	if mode == nil then
		mode = "n"
	end

	opts.desc = desc

	load_map(mode, keybind, func, opts)
end

M.load_keymaps = function(section, mapping_opt)
	vim.schedule(function()
		local mappings = require("core.keymaps")

		if type(section) == "string" then
			section = mappings[section]
		end

		for _, keymap in pairs(section) do
			M.load_keymap(keymap, mapping_opt)
		end
	end)
end

M.lazy_load = function(plugin)
	vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
		group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
		callback = function()
			local file = vim.fn.expand("%")
			local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

			if condition then
				vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

				if plugin ~= "nvim-treesitter" then
					vim.schedule(function()
						require("lazy").load({ plugins = plugin })

						if plugin == "nvim-lspconfig" then
							vim.cmd("silent! do FileType")
						end
					end, 0)
				else
					require("lazy").load({ plugins = plugin })
				end
			end
		end,
	})
end

return M
