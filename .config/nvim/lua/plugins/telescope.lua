return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = 'Telescope',
  keys = {
    { '<leader>p', ':Telescope find_files<CR>', noremap = true, silent = true, nowait = true },
    { '<leader>P', ':Telescope live_grep<CR>', noremap = true, silent = true, nowait = true },
    { '<leader>b', ':Telescope buffers<CR>', noremap = true, silent = true, nowait = true },
    { '<leader>q', ':Telescope oldfiles<CR>', noremap = true, silent = true, nowait = true },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      pickers = {
        find_files = {
          theme = 'dropdown',
          previewer = false,
          find_command = {
            'rg',
            '.',
            '--files',
            '--color=never',
            '--hidden',
            '--follow',
            '--iglob',
            '!.git/*',
            '--iglob',
            '!node_modules/**/*',
            '--iglob',
            '!*.dSYM/**/*',
          },
        },
      },
      defaults = {
        mappings = {
          n = {
            ['<C-c>'] = actions.close,
            ['<ESC>'] = actions.close,
          },
          i = {
            ['<C-c>'] = actions.close,
            ['<ESC>'] = actions.close,
            ['<C-l>'] = actions.select_default,
            ['<CR>'] = actions.select_default,
            ['<C-o>'] = actions.select_vertical,
            ['<C-h>'] = actions.select_horizontal,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-u>'] = false,
          },
        },
      },
    })
  end,
}
