require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    side = "left",
    width = 30,
  },
  filesystem_watchers = {
    enable = true,
  },
  renderer = {
    root_folder_label = false,
  }
})

vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")
