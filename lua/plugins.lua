-- Configure the Lazy Package Manager 

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 
    "rebelot/kanagawa.nvim",
    config = function() 
      vim.cmd.colorscheme("kanagawa-wave")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() 
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query","typescript" },
        auto_install = false,
        highlight = {
          enable = true
        }
      })
    end
  },
  {
    "williamboman/mason.nvim",
    config = function() 
      local mason = require("mason")
      mason.setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local masonLsp = require("mason-lspconfig")
      masonLsp.setup({
        ensure_installed = { "clangd" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({})
    end
  },
})

