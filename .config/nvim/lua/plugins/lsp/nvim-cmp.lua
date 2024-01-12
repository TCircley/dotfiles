return {
  'hrsh7th/nvim-cmp',
  event = 'VeryLazy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',
    'honza/vim-snippets',
  },
  config = function()
    local cmp = require('cmp')
    local snippy = require('snippy')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    local function has_words_before()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          snippy.expand_snippet(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<TAB>'] = cmp.mapping(function(fallback)
          if cmp.visible() and not snippy.can_jump(1) then
            cmp.select_next_item()
          elseif snippy.can_expand_or_advance() then
            snippy.expand_or_advance()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-TAB>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'snippy' },
      }, {
        { name = 'buffer' },
      }),
    })
  end,
}
