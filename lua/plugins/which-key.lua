return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local plugin = require 'which-key'
    plugin.setup {
      preset = 'modern',
      delay = 500,
      icons = {
        mappings = true,
      },
    }

    -- Register key groups for better organization
    plugin.add {
      { '<leader>f', group = 'Find' },
      { '<leader>l', group = 'LSP' },
      { '<leader>d', group = 'Diagnostics' },
      { '<leader>h', group = 'Git Hunks' },
      { '<leader>g', group = 'Git' },
      { '<leader>e', group = 'Explorer' },
      { '<leader>c', group = 'Code' },
      { '<leader>r', group = 'Rust' },
    }
  end,
}
