local map = vim.keymap.set

-- See https://github.com/nvim-tree/nvim-tree.lua

return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      local plugin = require 'nvim-tree'
      plugin.setup {
        update_focused_file = {
          enable = true, -- Enables the feature
          update_root = false, -- Don't change root directory when focusing files
          ignore_list = {}, -- List of buffer names / filetypes to ignore
        },
      }
      -- set up key maps for the file explorer
      map('n', '<leader>e', ':NvimTreeOpen<CR>', { noremap = true, silent = true, desc = 'Open the file explorer' })
      map('n', '<leader>ec', ':NvimTreeClose<CR>', { noremap = true, silent = true, desc = 'Close the file explorer' })
    end,
  },
}
