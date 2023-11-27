return {
  'ray-x/lsp_signature.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
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
