return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',
  config = function()
    require('Comment').setup({
      toggle = {
        line = 'gcc',
      },
    })
  end,
}
