return {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',
  config = function()
    local dap = require('dap')

    vim.api.nvim_set_hl(0, 'LspDiagnosticsSignBreakpoint', { fg = '#ffa09f' })
    vim.api.nvim_set_hl(0, 'LspDiagnosticsSignStopped', { fg = '#ffc777' })

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'LspDiagnosticsSignBreakpoint', linehl = '' })
    vim.fn.sign_define('DapStopped', { text = '→', texthl = 'LspDiagnosticsSignStopped', linehl = '' })

    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = vim.env.HOME .. '/.local/share/nvim/mason/packages/js-debug-adapter/js-debug-adapter',
        args = { '${port}' },
      },
    }
    dap.adapters['pwa-msedge'] = dap.adapters['pwa-node']
    dap.adapters['pwa-chrome'] = dap.adapters['pwa-node']

    -- codelldb
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
          local program = vim.fn.input('program: ')
          return vim.fn.getcwd() .. '/' .. program
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
      {
        name = 'Launch File with Arguments',
        type = 'codelldb',
        request = 'launch',
        program = function()
          local program = vim.fn.input('program: ')
          return vim.fn.getcwd() .. '/' .. program
        end,
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          return vim.split(args_string, ' ')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- javascript
    dap.configurations.javascript = {
      {
        name = 'Launch File (Node)',
        type = 'pwa-node',
        request = 'launch',
        runtimeExecutable = 'node',
        runtimeArgs = {},
        program = '${file}',
        cwd = '${workspaceFolder}',
      },
    }

    require('dap.ext.vscode').load_launchjs(nil, { ['pwa-msedge'] = { 'javascript' } })

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
