require("mason").setup()

local servers = { "clangd", "rust_analyzer", "tsserver", "html", "cssls", "tailwindcss", "gopls", "lua_ls" }
require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local util = require("lspconfig/util")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(_, _)

end

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

require("lspconfig")["gopls"].setup {
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
}

require("lspconfig")["lua_ls"].setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      }
    }
  }
}
