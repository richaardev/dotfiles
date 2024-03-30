require("core.settings")
require("core.lazy")

local M = {}

function M.setup()
	local keymaps = require("core.keymaps")
	local util = require("utils")

	util.keymap.load_keymaps(keymaps.general)
end

return M
