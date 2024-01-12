return {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',
  config = function()
    local dap = require('dap')

    vim.api.nvim_set_hl(0, 'LspDiagnosticsSignBreakpoint', { fg = '#ffa09f' })
    vim.api.nvim_set_hl(0, 'LspDiagnosticsSignStopped', { fg = '#ffc777' })

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'LspDiagnosticsSignBreakpoint', linehl = '' })
    vim.fn.sign_define('DapStopped', { text = '→', texthl = 'LspDiagnosticsSignStopped', linehl = '' })

    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
        args = { '--port', '${port}' },
      },
    }

    dap.configurations.cpp = {
      {
        name = 'Launch File',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    local function opts(desc)
      return { desc = 'nvim-dap: ' .. desc, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '<leader>5', '<cmd>DapContinue<CR>', opts('continue'))
    vim.keymap.set('n', '<leader>6', '<cmd>DapStepOver<CR>', opts('stepover'))
    vim.keymap.set('n', '<leader>7', '<cmd>DapStepInto<CR>', opts('stepinto'))
    vim.keymap.set('n', '<leader>8', '<cmd>DapStepOut<CR>', opts('stepout'))
    vim.keymap.set('n', '<leader>9', '<cmd>DapToggleBreakpoint<CR>', opts('toggle breakpoint'))
    vim.keymap.set('n', '<leader>0', '<cmd>DapTerminate<CR>', opts('terminate'))
  end,
}
