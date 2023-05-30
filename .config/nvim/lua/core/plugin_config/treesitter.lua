require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "javascript", "typescript", "tsx", "go", "gomod", "lua", "rust", "vim" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  }
}
