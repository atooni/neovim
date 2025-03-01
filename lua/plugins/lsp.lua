return(
{
  {
    "williamboman/mason.nvim",
    config = function()
      local mason = require("mason")
      mason.setup()
    end
  },
  {
    -- bridge mason and nvim-lspconfig
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      local mason_lsp = require("mason-lspconfig")
      mason_lsp.setup({
        ensure_installed = { "clangd", "lua_ls", "ts_ls" }
      })
      mason_lsp.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        -- language specific setups if required 
        -- See language server docs for config options 
        ["lua_ls"] = function()
          require("lspconfig")["lua_ls"].setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          })
        end
      })
    end
  },
  {
    -- Required as it will be called by mason-lspconfig
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" }
  }
}
)
