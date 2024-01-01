return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      highlights = {
        fill = {
          bg = '#21202e',
        },
        offset_separator = {
          bg = '#21202e',
        },
      },
      options = {
        mode = 'buffers',
        style_preset = bufferline.style_preset.no_bold,
        themable = true,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = true,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'NvimTree',
            text_align = 'center',
            separator = true,
          },
        },
        separator_style = 'thin',
      },
    })

    local function opts(desc)
      return { desc = 'bufferline: ' .. desc, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '<C-n>', ':bnext<CR>', opts('next'))
    vim.keymap.set('n', '<C-p>', ':bprev<CR>', opts('prev'))
  end,
}
