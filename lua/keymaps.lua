-- The leader key is "-"
vim.g.mapleader = ' '

-- Keymaps configuration
local map = vim.keymap.set

-- Buffer navigation
map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = "Go to next buffer" })
map('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = "Go to previous buffer" })

-- File Explorer
map('n', '<leader>e', ':NvimTreeOpen<CR>', { noremap = true, silent = true, desc = "Open the file explorer" })
map('n', '<leader>ec', ':NvimTreeClose<CR>', { noremap = true, silent = true, desc = "Close the file explorer" })
