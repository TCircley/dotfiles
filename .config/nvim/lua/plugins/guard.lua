return {
  'nvimdev/guard.nvim',
  dependencies = {
    'nvimdev/guard-collection',
  },
  config = function()
    local ft = require('guard.filetype')
    local guard = require('guard')

    ft('lua'):fmt('stylua')
    ft('javascript,typescript,javascriptreact,typescriptreact,vue'):fmt({
      cmd = 'prettier',
      args = {
        '--stdin-filepath',
        '--bracket-same-line',
        -- '--html-whitespace-sensitivity',
        -- 'ignore',
      },
      fname = true,
      stdin = true,
    })
    ft('html,css'):fmt('prettier')
    ft('c,cpp'):fmt({
      cmd = 'clang-format',
      args = {
        '--style',
        '{ AllowShortFunctionsOnASingleLine: Empty, BraceWrapping: { AfterCaseLabel: true, AfterControlStatement: true, AfterFunction: true, AfterStruct: true, BeforeElse: true, BeforeWhile: true }, BreakBeforeBraces: Custom, ColumnLimit: 132, IndentCaseLabels: true, IndentWidth: 4, SpaceAfterCStyleCast: true, TabWidth: 4 }',
      },
      stdin = true,
    })

    guard.setup({
      fmt_on_save = true,
      lsp_as_default_formatter = false,
    })
  end,
}
