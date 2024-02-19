require("core.settings")

local M = {}

function M.setup()
  local util = require("utils")

  util.keymap.load_keymaps("general", {})
  util.format.setup()
end

return M
