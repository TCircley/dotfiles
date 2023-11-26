return {
  'nvimdev/guard.nvim',
  dependencies = {
    'nvimdev/guard-collection',
  },
  config = function()
    local ft = require('guard.filetype')
    local guard = require('guard')

    ft('lua'):fmt('stylua')
    ft('javascript,typescript,javascriptreact,typescriptreact,vue'):fmt('prettier'):lint('eslint')
    ft('html,css'):fmt('prettier')
    ft('c,cpp'):fmt('clang-format'):lint('clang-tidy')

    guard.setup({
      fmt_on_save = true,
      lsp_as_default_formatter = false,
    })
  end,
}
