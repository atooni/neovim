-- The leader key is "-"
vim.g.mapleader = ','

-- Keymaps configuration
local map = vim.keymap.set

-- Buffer navigation
map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = 'Go to next buffer' })
map('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Go to previous buffer' })

-- Terminal mode: use Esc to exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })

-- Window management
map('n', '<leader>w=', '<C-w>=', { noremap = true, silent = true, desc = 'Equalize window sizes' })
map('n', '<leader>w|', '<C-w>|', { noremap = true, silent = true, desc = 'Maximize window width' })
map('n', '<leader>w_', '<C-w>_', { noremap = true, silent = true, desc = 'Maximize window height' })
map('n', '<leader>wh', '10<C-w><', { noremap = true, silent = true, desc = 'Decrease window width' })
map('n', '<leader>wl', '10<C-w>>', { noremap = true, silent = true, desc = 'Increase window width' })
map('n', '<leader>wj', '5<C-w>-', { noremap = true, silent = true, desc = 'Decrease window height' })
map('n', '<leader>wk', '5<C-w>+', { noremap = true, silent = true, desc = 'Increase window height' })
