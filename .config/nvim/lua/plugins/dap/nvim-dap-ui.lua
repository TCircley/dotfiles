return {
  'rcarriga/nvim-dap-ui',
  event = 'VeryLazy',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    local dap, dapui = require('dap'), require('dapui')
    local api = require('nvim-tree.api')

    dap.listeners.after.event_initialized['dapui_config'] = function()
      api.tree.close()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    dapui.setup({})
  end,
}
