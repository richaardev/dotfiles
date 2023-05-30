require("lualine").setup {
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
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_a = {
      {
        "buffers",
      }
    }
  }
}
