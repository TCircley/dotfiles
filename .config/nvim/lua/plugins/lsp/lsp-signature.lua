return {
  'ray-x/lsp_signature.nvim',
  lazy = true,
  config = function()
    require('lsp_signature').setup({
      bind = true,
      wrap = false,
      hint_enable = false,
      hint_prefix = '',
      hint_inline = function()
        return false
      end,
      doc_lines = 0,
      floating_window = true,
      floating_window_above_cur_line = true,
    })
  end,
}
