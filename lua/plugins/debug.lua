local map = vim.keymap.set

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      -- Setup dap-ui
      dapui.setup()

      -- Automatically open/close dap-ui when debugging starts/stops
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      -- Keybindings
      map('n', '<leader>xb', dap.toggle_breakpoint, { desc = 'Debug: Toggle breakpoint' })
      map('n', '<leader>xB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set conditional breakpoint' })
      map('n', '<leader>xc', dap.continue, { desc = 'Debug: Start/Continue' })
      map('n', '<leader>xo', dap.step_over, { desc = 'Debug: Step over' })
      map('n', '<leader>xi', dap.step_into, { desc = 'Debug: Step into' })
      map('n', '<leader>xO', dap.step_out, { desc = 'Debug: Step out' })
      map('n', '<leader>xu', dapui.toggle, { desc = 'Debug: Toggle UI' })
      map('n', '<leader>xt', dap.terminate, { desc = 'Debug: Terminate' })
      map('n', '<leader>xr', dap.repl.open, { desc = 'Debug: Open REPL' })
      map('n', '<leader>xl', dap.run_last, { desc = 'Debug: Run last' })

      -- Breakpoint signs
      vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '◐', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStopped', numhl = '' })

      -- Highlight groups
      vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#e51400' })
      vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379', bg = '#31353f' })
    end,
  },
}
