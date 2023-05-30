vim.g.mapleader = " "

local keymaps = {
  i = {
    -- Go to EOL
    ["<C-e>"] = { "<End>" },

    -- Move Lines
    ["<C-h>"] = { "<Left>" },
    ["<C-j>"] = { "<Down>" },
    ["<C-k>"] = { "<Up>" },
    ["<C-l>"] = { "<Right>" },


  },

  n = {
    -- Navigate between panels
    ["<C-h>"] = { ":wincmd h<CR>" },
    ["<C-j>"] = { ":wincmd j<CR>" },
    ["<C-k>"] = { ":wincmd k<CR>" },
    ["<C-l>"] = { ":wincmd l<CR>" },

    -- Buffer actions
    ["tj"] = { ":bprev<CR>" },
    ["tk"] = { ":bnext<CR>" },
    ["td"] = { ":bdelete<CR>" },

    -- Save File
    ["<C-s>"] = { "<cmd> w <CR>" },
  },

  v = {
    -- Move Lines
    ["J"] = {":m '>+1<CR>gv=gv"},
    ["K"] = {":m '<-2<CR>gv=gv"},
  }
}


local keymap = vim.keymap
for mode, section_keys in pairs(keymaps) do
  section_keys = (type(section_keys) == "table" and section_keys) or {}
  for keybind, _ in pairs(section_keys) do
    local action = keymaps[mode][keybind][1]
    local opts = keymaps[mode][keybind].opts or {}

    keymap.set(mode, keybind, action, opts)
  end
end
