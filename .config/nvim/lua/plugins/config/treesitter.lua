local options = {
  ensure_installed = { "javascript", "typescript", "tsx", "go", "gomod", "lua", "rust" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  }, 
}

return options