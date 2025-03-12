local map = vim.keymap.set

return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local plugin = require 'gitsigns'
    plugin.setup()
    map('n', '<leader>hn', ':Gitsigns next_hunk<CR>', { noremap = true, silent = true, desc = 'Go to the next hunk' })
    map(
      'n',
      '<leader>hp',
      ':Gitsigns prev_hunk<CR>',
      { noremap = true, silent = true, desc = 'Go to the previous hunk' }
    )
    map(
      'n',
      '<leader>hs',
      ':Gitsigns stage_hunk<CR>',
      { noremap = true, silent = true, desc = 'Stage the current hunk' }
    )
    map(
      'n',
      '<leader>hu',
      ':Gitsigns unstage_hunk<CR>',
      { noremap = true, silent = true, desc = 'Unstage the current hunk' }
    )
  end,
}
