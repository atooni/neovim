local map = vim.keymap.set

return (
{
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    map('n', '<leader>gg', ":LazyGit<CR>", { desc = "Open LazyGit" })
  end
}
)
