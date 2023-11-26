return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    local nvim_tmux_nav = require('nvim-tmux-navigation')

    local function opts(desc)
      return { desc = 'nvim-tmux-navigation: ' .. desc, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '<C-h>', ':NvimTmuxNavigateLeft<CR>', opts('Left'))
    vim.keymap.set('n', '<C-l>', ':NvimTmuxNavigateRight<CR>', opts('Right'))
    vim.keymap.set('n', '<C-k>', ':NvimTmuxNavigateUp<CR>', opts('Up'))
    vim.keymap.set('n', '<C-j>', ':NvimTmuxNavigateDown<CR>', opts('Down'))

    nvim_tmux_nav.setup({
      disable_when_zoomed = true,
    })
  end,
}
