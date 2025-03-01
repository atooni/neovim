local theme = "material"

return (
{
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000
  },
  {
    "luisiacc/the-matrix.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    priority = 10000,  -- Load this after all themes are loaded
    config = function()
      vim.cmd("colorscheme " .. theme)
    end,
  }
}
)
