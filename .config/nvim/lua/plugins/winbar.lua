return {
  'fgheng/winbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local winbar = require('winbar')
    winbar.setup({
      enabled = true,
      show_symbols = true,
    })
  end,
}
