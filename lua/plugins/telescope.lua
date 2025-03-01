local map = vim.keymap.set

return (
{
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        path_display = { "smart", "truncate" }
      }
    })
    -- Set up keymapping for diagnostics
    map('n', '<leader>dd', ":Telescope diagnostics<CR>", { desc = "Show diagnostics in Telescope" })
    map('n', '<leader>dr', ":Telescope lsp_references<CR>", { desc = "Show references in Telescope" })
  end
}
)
