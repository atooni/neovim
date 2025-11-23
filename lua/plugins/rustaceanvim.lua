local map = vim.keymap.set

return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  ft = { 'rust' },
  dependencies = { 'mfussenegger/nvim-dap' },
  config = function()
    -- Get Mason's install path for codelldb
    local mason_path = vim.fn.stdpath 'data' .. '/mason'
    local codelldb_path = mason_path .. '/bin/codelldb'
    local liblldb_path = mason_path .. '/packages/codelldb/extension/lldb/lib/liblldb.so'

    -- On macOS, the library has a different extension
    if vim.fn.has 'mac' == 1 then
      liblldb_path = mason_path .. '/packages/codelldb/extension/lldb/lib/liblldb.dylib'
    end

    vim.g.rustaceanvim = {
      dap = {
        adapter = require('rustaceanvim.config').get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      server = {
        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = 'clippy',
            },
          },
        },
      },
    }

    -- Rust-specific keybindings under <leader>r
    map('n', '<leader>rd', ':RustLsp externalDocs<CR>', {
      noremap = true,
      silent = true,
      desc = 'Rust: Open external docs (docs.rs)',
    })

    map('n', '<leader>rc', ':RustLsp openCargo<CR>', {
      noremap = true,
      silent = true,
      desc = 'Rust: Open Cargo.toml',
    })

    map('n', '<leader>rr', ':RustLsp runnables<CR>', {
      noremap = true,
      silent = true,
      desc = 'Rust: Show runnables',
    })

    map('n', '<leader>re', ':RustLsp expandMacro<CR>', {
      noremap = true,
      silent = true,
      desc = 'Rust: Expand macro',
    })

    map('n', '<leader>rm', ':RustLsp rebuildProcMacros<CR>', {
      noremap = true,
      silent = true,
      desc = 'Rust: Rebuild proc macros',
    })

    map('n', '<leader>rp', ':RustLsp parentModule<CR>', {
      noremap = true,
      silent = true,
      desc = 'Rust: Go to parent module',
    })

    map('n', '<leader>rj', ':RustLsp joinLines<CR>', {
      noremap = true,
      silent = true,
      desc = 'Rust: Join lines',
    })

    map('n', '<leader>rx', ':RustLsp debuggables<CR>', {
      noremap = true,
      silent = true,
      desc = 'Rust: Show debuggables',
    })
  end,
}
