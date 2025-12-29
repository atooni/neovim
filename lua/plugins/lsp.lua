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
      -- Configure diagnostics FIRST - disable updates while typing
      vim.diagnostic.config({
        update_in_insert = false, -- Critical: don't update diagnostics while typing
        virtual_text = {
          spacing = 4,
          prefix = '●',
        },
        signs = true,
        underline = true,
        severity_sort = true,
      })

      local mason = require 'mason'
      mason.setup()
    end,
  },
  {
    -- bridge mason and nvim-lspconfig
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'mason.nvim' },
    config = function()
      local mason_lsp = require 'mason-lspconfig'
      mason_lsp.setup {
        ensure_installed = { 'lua_ls', 'ts_ls', 'eslint', 'rust_analyzer', 'tailwindcss', 'angularls' },
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
          'codelldb',
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
          -- Try to fix eslint issues, but don't fail if it errors
          pcall(vim.cmd, 'EslintFixAll')
          -- Try to format, but don't fail if formatter errors (e.g., syntax errors)
          pcall(plugin.format, { bufnr = args.buf })
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
        '<leader>cf',
        function()
          plugin.format { bufnr = vim.api.nvim_get_current_buf() }
        end,
        { noremap = true, silent = true, desc = 'Format current file' }
      )
      map(
        'n',
        '<leader>cp',
        ':FormatProject<CR>',
        { noremap = true, silent = true, desc = 'Format all files in the project' }
      )
    end,
  },
  {
    -- LSP configuration using Neovim 0.11+ native vim.lsp.config
    'neovim/nvim-lspconfig',
    dependencies = { 'mason-lspconfig.nvim' },
    config = function()
      -- Configure lua_ls
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      -- Configure ts_ls with custom handlers
      vim.lsp.config('ts_ls', {
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        handlers = {
          ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
            -- Filter out unused variable warnings (6133, 6138)
            local ignored_codes = { 6133, 6138 }
            local filtered_diagnostics = {}
            for _, diagnostic in ipairs(result.diagnostics) do
              if not contains(ignored_codes, diagnostic.code) then
                table.insert(filtered_diagnostics, diagnostic)
              end
            end

            -- Replace with filtered diagnostics
            result.diagnostics = filtered_diagnostics

            -- Call the default handler
            vim.lsp.handlers['textDocument/publishDiagnostics'](_, result, ctx, config)
          end,
        },
      })

      -- Configure tailwindcss with rust support
      vim.lsp.config('tailwindcss', {
        filetypes = { 'rust', 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
        init_options = {
          userLanguages = {
            rust = 'html',
          },
        },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                'class: "([^"]*)"',
                'class=("([^"]*)")',
                [[class="([^"]*)"]],
                [[class:\s*"([^"]*)"]],
              },
            },
            colorDecorators = true,
            showPixelEquivalents = true,
          },
        },
        root_markers = { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts', 'Cargo.toml' },
      })

      -- ESLint LSP disabled - using command-line eslint via BufWritePre instead
      -- (not enabling eslint server)

      -- Enable the configured LSP servers (except rust_analyzer which is managed by rustaceanvim)
      vim.lsp.enable({ 'lua_ls', 'ts_ls', 'tailwindcss', 'angularls' })

      -- Keymaps
      map(
        'n',
        '<leader>ld',
        ':lua vim.lsp.buf.definition()<CR>',
        { noremap = true, silent = true, desc = 'LSP: Go to definition' }
      )
      map(
        'n',
        '<leader>lm',
        ':lua vim.lsp.buf.rename()<CR>',
        { noremap = true, silent = true, desc = 'LSP: Rename/move symbol' }
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
