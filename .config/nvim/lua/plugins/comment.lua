return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup({
      toggle = {
        line = 'gcc',
      },
    })
  end,
}
