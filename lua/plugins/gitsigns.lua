local map = vim.keymap.set

return {
  'lewis6991/gitsigns.nvim',
  enabled = true,
  config = function()
    local plugin = require 'gitsigns'
    plugin.setup {
      current_line_blame = false,
      current_line_blame_opts = {
        delay = 500,
      },
    }

    -- Git blame keymaps
    map('n', '<leader>gb', function()
      vim.cmd('Gitsigns toggle_current_line_blame')
    end, { noremap = true, silent = true, desc = 'Toggle git blame' })
    map('n', '<leader>gB', function()
      require('gitsigns').blame_line({ full = true })
    end, { noremap = true, silent = true, desc = 'Blame current line (full)' })

    -- Git hunk keymaps
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
    map(
      'n',
      '<leader>hv',
      ':Gitsigns preview_hunk<CR>',
      { noremap = true, silent = true, desc = 'Preview the current hunk (show diff)' }
    )
  end,
}
