return {
  "folke/which-key.nvim",
  enabled = vim.g.vscode == nil,
  event = { "VeryLazy" },
  keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
  init = function()
    require("utils").keymap.load_keymaps("whichkey")
  end,
  cmd = "WhichKey",
  opts = {
    triggers = { "<leader>" },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
