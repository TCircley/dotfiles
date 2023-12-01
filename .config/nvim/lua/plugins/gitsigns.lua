return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  config = function()
    local gitsigns = require('gitsigns')

    gitsigns.setup({
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        untracked = { text = '*' },
      },
      signcolum = true,
    })
  end,
}
