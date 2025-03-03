local map = vim.keymap.set

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
        ensure_installed = { "clangd", "lua_ls", "ts_ls", "eslint" }
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
        end,
        ["eslint"] = function()
          require('lspconfig').eslint.setup {
            root_dir = require('lspconfig').util.root_pattern('.git', 'package.json'),
          }
        end
      })
    end
  },
  {
    -- Required as it will be called by mason-lspconfig
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
    config = function()
      vim.lsp.set_log_level("debug")
      map('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc = "LSP: Go to definition" })
    end
  }
}
)
