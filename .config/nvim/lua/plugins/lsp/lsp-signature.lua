return {
  'ray-x/lsp_signature.nvim',
  lazy = true,
  config = function()
    require('lsp_signature').setup({
      bind = true,
      doc_lines = 10,
      wrap = true,
      max_height = 4,
      floating_window = true,
      floating_window_above_cur_line = true,
      hint_enable = false,
      hint_prefix = '',
      hint_inline = function()
        return false
      end,
    })
  end,
}
