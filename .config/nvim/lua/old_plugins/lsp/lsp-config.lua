-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua
return {
  {
    "j-hui/fidget.nvim",
    opts = {},
  },

  { import = "plugins.lsp.servers.typescript" },
  { import = "plugins.lsp.servers.tailwindcss" },
  { import = "plugins.lsp.servers.jsonls" },
  { import = "plugins.lsp.servers.gopls" },

  {
    "smjonas/inc-rename.nvim",
    keys = {
      { "<leader>ra", ":IncRename " },
    },
    opts = {
      cmd_name = "IncRename",  -- the name of the command
      hl_group = "Substitute", -- the highlight group used for highlighting the identifier's new name
      preview_empty_name = false, -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
      show_message = true,     -- whether to display a `Renamed m instances in n files` message after a rename operation
      input_buffer_type = nil, -- the type of the external input buffer to use (the only supported value is currently "dressing")
      post_hook = nil,         -- callback to run after renaming, receives the result table (from LSP handler) as an argument
    },
  },

  {
    "neovim/nvim-lspconfig",
    enabled = vim.g.vscode == nil,
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {},
          },
        },
      },
      setup = {},
    },
    config = function(_, opts)
      local utils = require("utils")

      utils.lsp.on_attach(function(client, buffer)
        utils.keymap.load_keymaps("lspconfig", { buffer = buffer })
      end)

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    enabled = vim.g.vscode == nil,
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {},
    },
    config = function(_, opts)
      require("mason").setup(opts)
      -- local mr = require("mason-registry")

      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          print("Installing...")
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})
      -- local function ensure_installed()
      -- 	for _, tool in ipairs(opts.ensure_installed) do
      -- 		local p = mr.get_package(tool)
      -- 		if not p:is_installed() then
      -- 			p:install()
      -- 		end
      -- 	end
      -- end
      --
      -- if mr.refresh then
      -- 	mr.refresh(ensure_installed)
      -- else
      -- 	ensure_installed()
      -- end
    end,
  },
}
