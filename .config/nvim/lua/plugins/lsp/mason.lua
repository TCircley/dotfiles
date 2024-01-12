return {
  'williamboman/mason.nvim',
  lazy = true,
  config = function()
    require('mason').setup({
      ui = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    })
  end,
}
