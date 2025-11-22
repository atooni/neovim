-- Configure the Lazy Package Manager

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.themes',
  { 'nvim-tree/nvim-web-devicons', opts = {} },
  require 'plugins.which-key',
  require 'plugins.lsp',
  require 'plugins.completion',
  require 'plugins.rustaceanvim',
  require 'plugins.tree',
  require 'plugins.fzf-lua',
  require 'plugins.lazygit',
  require 'plugins.gitsigns',
  require 'plugins.lualine',
  require 'plugins.diffview',
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'typescript', 'rust' },
        auto_install = false,
        highlight = {
          enable = true,
        },
      }
    end,
  },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {
        render = 'background',
        enable_tailwind = true,
      }
    end,
  },
}
