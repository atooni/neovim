require("options")
require("plugins")

-- TODO: Handle properly 
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function() 
    vim.lsp.start({
      name = 'clangd',
      cmd = {'/usr/bin/clangd'},
      root_dir = vim.fn.getcwd()
    })
  end
})

