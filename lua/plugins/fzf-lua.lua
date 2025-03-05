local map = vim.keymap.set

return {
  'ibhagwan/fzf-lua',
  config = function()
    local plugin = require 'fzf-lua'
    plugin.setup()

    map('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'Open fzf for files by name' })
    map('n', '<leader>fg', ':FzfLua live_grep<CR>', { desc = 'Open fzf for grep' })
    map('n', '<leader>fb', ':FzfLua buffers<CR>', { desc = 'Open fzf for the currently open buffers' })
    map('n', '<leader>fw', ':FzfLua lsp_workspace_symbols<CR>', { desc = 'Open fzf for symbols in the workspace' })
    map('n', '<leader>fd', ':FzfLua lsp_document_symbols<CR>', { desc = 'Open fzf for symbols in the document' })
    map('n', '<leader>fs', ':FzfLua git_status<CR>', { desc = 'Open fzf for the git status' })

    map('n', '<leader>dd', ':FzfLua diagnostics_document<CR>', { desc = 'Open fzf for document diagnostics' })
    map('n', '<leader>dw', ':FzfLua diagnostics_workspace<CR>', { desc = 'Open fzf for workspace diagnostics' })
    map('n', '<leader>dr', ':FzfLua lsp_references<CR>', { desc = 'Open fzf for LSP x references' })
  end,
}
