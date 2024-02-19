print("ok")
require("core")
require("core.utils").load_keymaps("general")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").lazy(lazypath)
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
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
  -- {
  -- 	"catppuccin/nvim",
  -- 	name = "catppuccin",
  -- 	lazy = false,
  -- 	priority = 1000,
  -- 	opts = {},
  -- 	init = function()
  -- 		vim.cmd("colorscheme catppuccin-macchiato")
  -- 	end,
  -- },

  change_detection = {
    enable = false,
    notify = false,
  },
})

if vim.g.vscode then
  print("Hello VSCode!!!")
end

-- require("core.utils").load_keymaps({"<a-l>", function () print("hello") end, mode = {"n", "i"}, desc = "test"})
