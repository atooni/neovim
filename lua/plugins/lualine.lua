return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local plugin = require 'lualine'
    plugin.setup {
      sections = {
        lualine_a = {
          'mode',
          function()
            return 'W' .. vim.api.nvim_win_get_number(0)
          end,
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
