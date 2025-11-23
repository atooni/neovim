-- The leader key is "-"
vim.g.mapleader = ','

-- Keymaps configuration
local map = vim.keymap.set

-- Buffer navigation
map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = 'Go to next buffer' })
map('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Go to previous buffer' })

-- Terminal mode: use Esc to exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })
