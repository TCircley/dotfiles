return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  config = function()
    local lualine = require('lualine')

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = true,
    }

    local diff = {
      'diff',
      colored = true,
      diff_color = {
        added = { fg = '#73daca' },
        modified = { fg = '#7aa2f7' },
        removed = { fg = '#f7768e' },
      },
      cond = hide_in_width,
      source = nil,
    }

    local branch = {
      'branch',
      icons_enabled = true,
      icon = '',
    }

    lualine.setup({
      options = {
        theme = 'tokyonight',
        disabled_filetypes = { 'NvimTree' },
      },
      sections = {
        lualine_a = { branch, diagnostics },
        lualine_b = { diff },
      },
      extensions = { 'nvim-tree' },
    })
  end,
}
