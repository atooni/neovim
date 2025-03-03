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
        ["ts_ls"] = function()
          require("lspconfig")["ts_ls"].setup({
            handlers = {
              ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)

                print("TS_LS DIAGNOSTICS HANDLER")
                print("Number of diagnostics: " .. #result.diagnostics)

                -- Log each diagnostic
                for i, diag in ipairs(result.diagnostics) do
                  print(string.format("[%d] : Source [%s] Code: %s, Message: %s",
                  i,
                  diag.source,
                  tostring(diag.code),
                  diag.message))
                end

                -- Filter out ALL unused variable warnings (code 6133)
                local filtered_diagnostics = {}
                for _, diagnostic in ipairs(result.diagnostics) do
                  if diagnostic.code ~= 6133 then
                    table.insert(filtered_diagnostics, diagnostic)
                  end
                end

                print("After filtering: " .. #filtered_diagnostics .. " diagnostics")

                -- Replace with filtered diagnostics
                result.diagnostics = filtered_diagnostics

                -- Call the default handler
                vim.lsp.handlers["textDocument/publishDiagnostics"](_, result, ctx, config)
              end
            }
          })
        end,

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
