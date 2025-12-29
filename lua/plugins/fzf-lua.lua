local map = vim.keymap.set

return {
  'ibhagwan/fzf-lua',
  config = function()
    local plugin = require 'fzf-lua'
    plugin.setup({
      files = {
        path_shorten = 1,  -- shorten path to 1 char per directory
      },
      buffers = {
        path_shorten = 1,  -- e.g. ~/p/n/lua/plugins/fzf-lua.lua
      },
    })

    map('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'Open fzf for files by name' })
    map('n', '<leader>fg', ':FzfLua live_grep<CR>', { desc = 'Open fzf for grep' })
    map('n', '<leader>fW', ':FzfLua grep_cword<CR>', { desc = 'Grep word under cursor' })
    map('v', '<leader>fW', ':FzfLua grep_visual<CR>', { desc = 'Grep visual selection' })
    map('n', '<leader>fb', ':FzfLua buffers<CR>', { desc = 'Open fzf for the currently open buffers' })
    map('n', '<leader>fw', ':FzfLua lsp_workspace_symbols<CR>', { desc = 'Open fzf for symbols in the workspace' })
    map('n', '<leader>fd', ':FzfLua lsp_document_symbols<CR>', { desc = 'Open fzf for symbols in the document' })
    map('n', '<leader>fs', ':FzfLua git_status<CR>', { desc = 'Open fzf for the git status' })

    map('n', '<leader>dd', ':FzfLua diagnostics_document<CR>', { desc = 'Open fzf for document diagnostics' })
    map('n', '<leader>dw', ':FzfLua diagnostics_workspace<CR>', { desc = 'Open fzf for workspace diagnostics' })
    map('n', '<leader>lr', ':FzfLua lsp_references<CR>', { desc = 'Open fzf for LSP references' })
    map('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Show diagnostic under cursor' })
    map('n', '<leader>dn', function()
      vim.diagnostic.goto_next { float = true }
    end, { desc = 'Jump to next diagnostic' })
    map('n', '<leader>dp', function()
      vim.diagnostic.goto_prev { float = true }
    end, { desc = 'Jump to previous diagnostic' })
  end,
}
