local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not pcall(require, 'lazy') then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    { import = 'plugins' },
    { import = 'plugins/lsp' },
    { import = 'plugins/dap' },
  },
  install = {
    colorscheme = { 'tokyonight' },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = { enabled = false },
  change_detection = { enabled = false },
})
