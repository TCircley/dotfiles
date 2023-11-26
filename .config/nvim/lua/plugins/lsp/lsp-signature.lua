return {
  'ray-x/lsp_signature.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  config = function()
    local lsp_signature = require('lsp_signature')

    lsp_signature.setup({
      bind = true,
      wrap = true,
      floating_window = true,
      floating_window_above_cur_line = true,
    })
  end,
}
