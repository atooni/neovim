return {
  'swaits/zellij-nav.nvim',
  lazy = false,
  config = function()
    require('zellij-nav').setup()

    local map = vim.keymap.set
    map('n', '<c-h>', '<cmd>ZellijNavigateLeft<cr>', { silent = true, desc = 'Navigate left' })
    map('n', '<c-j>', '<cmd>ZellijNavigateDown<cr>', { silent = true, desc = 'Navigate down' })
    map('n', '<c-k>', '<cmd>ZellijNavigateUp<cr>', { silent = true, desc = 'Navigate up' })
    map('n', '<c-l>', '<cmd>ZellijNavigateRight<cr>', { silent = true, desc = 'Navigate right' })
  end,
}
