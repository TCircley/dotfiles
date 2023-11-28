return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'rush-rs/tree-sitter-asm',
  },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.parsers').get_parser_configs().asm = {
      install_info = {
        url = 'https://github.com/rush-rs/tree-sitter-asm.git',
        files = { 'src/parser.c' },
        branch = 'main',
      },
    }

    local configs = require('nvim-treesitter.configs')
    configs.setup({
      ensure_installed = {
        'asm',
        'c',
        'html',
        'css',
        'vue',
        'javascript',
        'json',
        'cmake',
        'make',
        'markdown',
        'markdown_inline',
      },
      modules = {},
      ignore_install = {},
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = { 'make' },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          node_decremental = '<BS>',
          scope_incremental = '<TAB>',
        },
      },
      indent = { enable = true },
    })
  end,
}
