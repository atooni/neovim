local map = vim.keymap.set

-- See https://github.com/nvim-tree/nvim-tree.lua

return(
{
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      local tree = require("nvim-tree")
      tree.setup({})
      -- set up key maps for the file explorer 
      map('n', '<leader>e', ':NvimTreeOpen<CR>', { noremap = true, silent = true, desc = "Open the file explorer" })
      map('n', '<leader>ec', ':NvimTreeClose<CR>', { noremap = true, silent = true, desc = "Close the file explorer" })
    end
  }
}
)
