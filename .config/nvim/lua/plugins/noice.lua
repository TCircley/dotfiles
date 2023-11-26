return {
  'folke/noice.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  event = 'VeryLazy',
  config = function()
    local noice = require('noice')
    noice.setup({
      lsp = {
        signature = {
          enabled = false,
        },
        override = {
          ['vim.lsp.util.convert_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      preset = {
        bottom_search = true,
        command_palate = true,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
          relative = 'editor',
          position = {
            row = '40%',
            col = '50%',
          },
          size = {
            width = '35%',
          },
        },
      },
    })
  end,
}
