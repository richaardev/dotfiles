return {
	"nvim-pack/nvim-spectre",
	enabled = vim.g.vscode == nil,
	build = false,
	cmd = "Spectre",
	opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>rr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
}
