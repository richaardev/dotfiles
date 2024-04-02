---@class utils.keymap
local M = {}

---@param keymap table
---@param mapping_opt? table
M.load_keymap = function(keymap, mapping_opt)
	if type(keymap) ~= "table" then
		return
	end

	function load_map(mode, keybind, action, options)
		local default_opts = vim.tbl_deep_extend("force", { mode = mode }, mapping_opt or {})

		local opts = vim.tbl_deep_extend("force", default_opts, options or {})

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

---@param section table | string
---@param mapping_opt? table
M.load_keymaps = function(section, mapping_opt)
	vim.schedule(function()
		-- local mappings = require("core.keymaps")

		if type(section) == "string" then
			-- 	section = mappings[section]
			return
		end

		for _, keymap in pairs(section) do
			M.load_keymap(keymap, mapping_opt)
		end
	end)
end

return M
