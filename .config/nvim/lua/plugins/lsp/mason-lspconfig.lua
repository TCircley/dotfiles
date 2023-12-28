return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')

    mason_lspconfig.setup({})

    local function on_attach()
      vim.diagnostic.config({ virtual_text = false, signs = true, underline = true, update_in_insert = true })
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
        })
      end,
      ['lua_ls'] = function()
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
              runtime = {
                version = 'LuaJIT',
              },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file('', true),
              },
            },
          },
        })
      end,
    })

    -- lsp key mapping
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = function(desc)
          return { desc = 'lsp: ' .. desc, buffer = ev.buf, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts('hover'))
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts('go definition'))
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts('go declaration'))
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts('go type_definition'))
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts('go implementation'))
        vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts('go signature_help'))
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename, opts('rename'))
        vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, opts('code_action'))
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts('references'))
        vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, opts('diagnostic previous'))
        vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, opts('diagnostic next'))
      end,
    })
  end,
}
