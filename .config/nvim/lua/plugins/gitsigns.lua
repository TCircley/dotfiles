return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  config = function()
    local gitsigns = require('gitsigns')

    gitsigns.setup({
      signs = {
        delete = { text = '-' },
        untracked = { text = '*' },
      },
      signcolumn = true,
    })
  end,
}
