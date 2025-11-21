local map = vim.keymap.set

return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  ft = { 'rust' },
  config = function()
    vim.g.rustaceanvim = {
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
  end,
}
