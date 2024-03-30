return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = vim.g.vscode == nil,
  -- enabled = false,
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  init = function()
    local neotree = {
      { "<C-n>", "<cmd>Neotree filesystem toggle<CR>", desc = "Toggle nneotree" },
    }

    require("utils").keymap.load_keymaps(neotree)
  end,
  opts = function()
    return {
      close_if_last_window = true,
      -- popup_border_style = "rounded",
      window = {
        -- position = "float",
        position = "left",
        mappings = {
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "copy path to clipboard",
          },
        }
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            ".git"
          }
        },
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            added     = " ",
            modified  = " ",
            deleted   = " ",
            renamed   = "󰁕",

            -- Status type
            staged    = "✓",
            unstaged  = "✗",
            untracked = "★",
            ignored   = "◌",
            conflict  = "",
          }
        }
      },
      event_handlers = {
        -- {
        -- 	event = "file_opened",
        -- 	handler = function(file_path)
        -- 		require("neo-tree.command").execute({ action = "close" })
        -- 	end,
        -- },
      },
    }
  end,
  config = function(_, opts)
    vim.fn.sign_define("DiagnosticSignError",
      { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn",
      { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo",
      { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint",
      { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup(opts)
  end,
}
