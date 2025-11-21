local map = vim.keymap.set

local function contains(arr, x)
  for _, v in ipairs(arr) do
    if v == x then
      return true
    end
  end
  return false
end

return {
  {
    'williamboman/mason.nvim',
    config = function()
      local mason = require 'mason'
      mason.setup()
    end,
  },
  {
    -- bridge mason and nvim-lspconfig
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'mason.nvim' , 'neovim/nvim-lspconfig'},
    config = function()
      -- Ensure lspconfig is loaded first
      require('lspconfig')

      local mason_lsp = require 'mason-lspconfig'
      mason_lsp.setup {
        ensure_installed = { 'lua_ls', 'ts_ls', 'eslint', 'rust_analyzer' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {}
          end,
          -- language specific setups if required
          -- See language server docs for config options
          -- Skip rust_analyzer since rustaceanvim handles it
          ['rust_analyzer'] = function()
            -- Do nothing, rustaceanvim manages this
          end,
          ['ts_ls'] = function()
            require('lspconfig')['ts_ls'].setup {
              on_attach = function(client, _)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
              end,
              handlers = {
                ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
                  print 'TS_LS DIAGNOSTICS HANDLER'
                  print('Number of diagnostics: ' .. #result.diagnostics)

                  -- Log each diagnostic
                  for _, diag in ipairs(result.diagnostics) do
                    vim.print(diag)
                  end

                  -- Filter out ALL unused variable warnings
                  local ignored_codes = { 6133, 6138 }
                  local filtered_diagnostics = {}
                  for _, diagnostic in ipairs(result.diagnostics) do
                    if not contains(ignored_codes, diagnostic.code) then
                      table.insert(filtered_diagnostics, diagnostic)
                    end
                  end

                  print('After filtering: ' .. #filtered_diagnostics .. ' diagnostics')

                  -- Replace with filtered diagnostics
                  result.diagnostics = filtered_diagnostics

                  -- Call the default handler
                  vim.lsp.handlers['textDocument/publishDiagnostics'](_, result, ctx, config)
                end,
              },
            }
          end,

          ['lua_ls'] = function()
            require('lspconfig')['lua_ls'].setup {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' },
                  },
                },
              },
            }
          end,

          ['eslint'] = function()
            require('lspconfig').eslint.setup {
              root_dir = require('lspconfig').util.root_pattern('.git', 'package.json'),
            }
          end,
        },
      }
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      local plugin = require 'mason-tool-installer'
      plugin.setup {
        ensure_installed = {
          'prettier',
          'stylua',
          'rustfmt',
        },
      }
    end,
  },
  {
    'stevearc/conform.nvim',
    config = function()
      local plugin = require 'conform'
      plugin.setup {
        formatters = {
          stylua = {
            args = { '-v', '-f', vim.fn.expand '~/.config/nvim/stylua.toml', '-' },
          },
        },
        formatters_by_ft = {
          typescript = { 'prettier' },
          javascript = { 'prettier' },
          lua = { 'stylua' },
          rust = { 'rustfmt' },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = 'fallback',
        },
      }
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.ts', '*.js', '*.tsx', '*.jsx' },
        callback = function(args)
          vim.cmd 'EslintFixAll'
          plugin.format { bufnr = args.buf }
        end,
      })
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.rs' },
        callback = function(args)
          plugin.format { bufnr = args.buf }
        end,
      })
      map(
        'n',
        '<leader>cp',
        ':FormatProject<CR>',
        { noremap = true, silent = true, desc = 'Format all files in the project' }
      )
    end,
  },
  {
    -- Required as it will be called by mason-lspconfig
    'neovim/nvim-lspconfig',
    dependencies = { 'mason-lspconfig.nvim' },
    config = function()
      map(
        'n',
        '<leader>ld',
        ':lua vim.lsp.buf.definition()<CR>',
        { noremap = true, silent = true, desc = 'LSP: Go to definition' }
      )
      map(
        'n',
        '<leader>lr',
        ':lua vim.lsp.buf.rename()<CR>',
        { noremap = true, silent = true, desc = 'LSP: Rename symbol' }
      )
      map(
        'n',
        '<leader>lh',
        ':lua vim.lsp.buf.hover()<CR>',
        { noremap = true, silent = true, desc = 'LSP: Show hover documentation' }
      )
      map(
        'n',
        'K',
        ':lua vim.lsp.buf.hover()<CR>',
        { noremap = true, silent = true, desc = 'LSP: Show hover documentation' }
      )
    end,
  },
}
