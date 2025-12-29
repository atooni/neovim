-- The leader key is "-"
vim.g.mapleader = ','

-- Keymaps configuration
local map = vim.keymap.set

-- Visual block mode (Ctrl+v alternative for terminals that capture it)
map('n', '<leader>v', '<C-v>', { noremap = true, silent = true, desc = 'Visual block mode' })

-- Buffer navigation
map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = 'Go to next buffer' })
map('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Go to previous buffer' })

-- Window management
map('n', '<leader>w=', '<C-w>=', { noremap = true, silent = true, desc = 'Equalize window sizes' })
map('n', '<leader>w|', '<C-w>|', { noremap = true, silent = true, desc = 'Maximize window width' })
map('n', '<leader>w_', '<C-w>_', { noremap = true, silent = true, desc = 'Maximize window height' })
map('n', '<leader>wh', '10<C-w><', { noremap = true, silent = true, desc = 'Decrease window width' })
map('n', '<leader>wl', '10<C-w>>', { noremap = true, silent = true, desc = 'Increase window width' })
map('n', '<leader>wj', '5<C-w>-', { noremap = true, silent = true, desc = 'Decrease window height' })
map('n', '<leader>wk', '5<C-w>+', { noremap = true, silent = true, desc = 'Increase window height' })

-- Toggle ESLint linting (keep TypeScript LSP working)
map('n', '<leader>te', function()
  vim.cmd('LspStop eslint')
  print("ESLint stopped")
end, { noremap = true, silent = false, desc = 'Stop ESLint linting' })

map('n', '<leader>tE', function()
  vim.cmd('LspStart eslint')
  print("ESLint started")
end, { noremap = true, silent = false, desc = 'Start ESLint linting' })
