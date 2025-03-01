-- See https://github.com/nvim-tree/nvim-tree.lua

return(
{
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      local tree = require("nvim-tree")
      tree.setup({})
    end
  }
}
)
