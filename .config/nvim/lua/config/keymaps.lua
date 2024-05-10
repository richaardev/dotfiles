local keymal = require("utils.keymap")
local map = keymal.map

map("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })
map({ "n" }, "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- Add new undo point
map("i", ".", ".<c-g>u", { desc = "Add new undo point" })
map("i", ",", ",<c-g>u", { desc = "Add new undo point" })
map("i", ";", ";<c-g>u", { desc = "Add new undo point" })

-- Buffer actions
map("n", "L", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "H", "<cmd>bprevious<cr>", { desc = "Next buffer" })

-- Tab Actions
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Next buffer" })

-- move lines
map("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("n", "<M-J>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("v", "<M-K>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
map("v", "<M-J>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
map("v", "<", "<gv", { desc = "Indent line" })
map("v", ">", ">gv", { desc = "Indent line" })

vim.keymap.del({ "t", "n" }, "<C-/>")
vim.keymap.del({ "n" }, "<leader>L")
vim.keymap.del({ "n" }, "<leader>ft")
vim.keymap.del({ "n" }, "<leader>fT")
