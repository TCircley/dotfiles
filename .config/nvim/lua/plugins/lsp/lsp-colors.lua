return {
  'folke/lsp-colors.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local lsp_colors = require('lsp-colors')
    lsp_colors.setup({})
  end,
}
