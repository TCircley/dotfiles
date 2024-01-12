return {
  'stevearc/aerial.nvim',
  lazy = true,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local aerial = require('aerial')
    aerial.setup({
      backends = { 'lsp', 'treesitter' },
      update_events = 'TextChanged,InsertLeave',
      filter_kind = {
        'Class',
        'Constructor',
        'Enum',
        'Function',
        'Interface',
        'Module',
        'Method',
        'Struct',
      },
      lsp = {
        diagnostics_trigger_update = false,
        update_delay = 100,
      },
    })
  end,
}
