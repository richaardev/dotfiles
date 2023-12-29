local options = {
  options = {
    icons_enabled = true,
    theme = "onedark",
    component_separators = "|",
    section_separators = "",
    always_divide_middle = true,
    disabled_filetypes = {
        "NvimTree"
    },
  },
  sections = {
    lualine_c = {
      {
        "buffers",
      }
    }
  }
}

return options
