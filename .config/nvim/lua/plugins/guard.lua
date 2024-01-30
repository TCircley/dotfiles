return {
  'nvimdev/guard.nvim',
  dependencies = {
    'nvimdev/guard-collection',
  },
  config = function()
    local ft = require('guard.filetype')
    local guard = require('guard')
    local BASE_PACKAGES_PATH = vim.env.HOME .. '/.local/share/nvim/mason/packages'

    ft('lua'):fmt({
      cmd = BASE_PACKAGES_PATH .. '/stylua/stylua',
      args = {
        '-',
      },
      stdin = true,
    })

    ft('html,css,javascript,typescript,javascriptreact,typescriptreact,vue'):fmt({
      cmd = BASE_PACKAGES_PATH .. '/prettier/node_modules/prettier/bin/prettier.cjs',
      args = {
        '--stdin-filepath',
        '--bracket-same-line',
        -- '--html-whitespace-sensitivity',
        -- 'ignore',
      },
      fname = true,
      stdin = true,
    })
    ft('c,cpp'):fmt({
      cmd = BASE_PACKAGES_PATH .. '/clang-format/venv/bin/clang-format',
      args = {
        '--style',
        '{ AllowShortFunctionsOnASingleLine: Empty, BraceWrapping: { AfterCaseLabel: true, AfterControlStatement: true, AfterFunction: true, AfterStruct: true, BeforeElse: true, BeforeWhile: true }, BreakBeforeBraces: Custom, ColumnLimit: 132, IndentCaseLabels: true, IndentWidth: 4, SpaceAfterCStyleCast: true, TabWidth: 4 }',
      },
      stdin = true,
    })

    ft('python'):fmt({
      cmd = vim.env.HOME .. '/.local/share/nvim/mason/packages/yapf/venv/bin/yapf',
      args = {
        '--quiet',
      },
      stdin = true,
    })

    guard.setup({
      fmt_on_save = true,
      lsp_as_default_formatter = false,
    })
  end,
}
