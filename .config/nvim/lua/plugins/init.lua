local default_plugins = {
	-- Theme
	{ 
    "catppuccin/nvim", as = "catppuccin",
    init = function()
      vim.cmd "colorscheme catppuccin-mocha"
    end,
  },

	{
    "nvim-tree/nvim-tree.lua",
    -- cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "plugins.config.nvim-tree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
	{ "nvim-tree/nvim-web-devicons" },

  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "*",
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   opts = function()
  --     return require "plugins.config.bufferline"
  --   end,
  --   config = function(_, opts)
  --     require("bufferline").setup(opts)
  --   end,
  -- },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    init = function()
      require("core.utils").load_mappings "whichkey"
    end,
    cmd = "WhichKey",
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },

	{ 
    "nvim-lualine/lualine.nvim",
    opts = function()
      return require "plugins.config.lualine"
    end,
  },   

	{ 
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "plugins.config.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }, 

	{
    "windwp/nvim-autopairs",
    opts = function()
      require "plugins.config.autopairs"
    end,
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      -- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

	{ 
    "akinsho/toggleterm.nvim",
    opts = function()
      return require("plugins.config.others").toggleterm
    end,
  },

	-- File search
	{
    "nvim-telescope/telescope.nvim",
    -- dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings "telescope"
    end,
    opts = function()
      return require "plugins.config.telescope"
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      -- for _, ext in ipairs(opts.extensions_list) do
      --   telescope.load_extension(ext)
      -- end
    end,
  },

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	-- { "saadparwaiz1/cmp_luasnip" },

	{ 
    "j-hui/fidget.nvim",
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      require("core.utils").load_mappings "comment"
    end,
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",
    init = function()
      require("core.utils").lazy_load "indent-blankline.nvim"
    end,
    opts = function(t)
      return require("plugins.config.others").blankline
    end,
    config = function(_, opts)
      require("core.utils").load_mappings "blankline"
      require("indent_blankline").setup(opts)
    end,
  },
}

-- local config = require("core.utils").load_config()

-- if #config.plugins > 0 then
--   table.insert(default_plugins, { import = config.plugins })
-- end

require("lazy").setup(default_plugins, {})
