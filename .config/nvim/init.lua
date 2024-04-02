local core = require("core")
require("config.lazy")
core.setup()

local stats = require("lazy").stats()
local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
print("⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms")
