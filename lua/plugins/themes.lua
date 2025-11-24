local theme = "kanagawa"

return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme " .. theme)
    end,
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
}
