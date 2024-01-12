return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local toggleterm = require('toggleterm')
    toggleterm.setup({
      open_mapping = [[<leader>j]],
      start_in_insert = true,
      insert_mappings = false,
      terminal_mappings = true,
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
      winbar = {
        enabled = true,
        name_formatter = function(term)
          return term.name
        end,
      },
    })
  end,
}
