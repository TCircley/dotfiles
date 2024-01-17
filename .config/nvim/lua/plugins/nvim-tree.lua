return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>e', ':NvimTreeToggle<CR>', noremap = true, silent = true, nowait = true },
  },
  init = function()
    local api = require('nvim-tree.api')

    local function open_nvim_tree(args)
      local path = vim.v.argv[3]
      local is_real_file = vim.fn.filereadable(path) == 1
      local is_directory = vim.fn.isdirectory(path) == 1
      local is_no_name = args.file == '' and vim.bo[args.buf].buftype == ''

      if is_directory then
        vim.cmd.cd(path)
        api.tree.open()
      elseif is_real_file or is_no_name then
        api.tree.toggle({ focus = false, find_file = true })
      else
        return
      end
    end

    vim.api.nvim_create_autocmd({ 'VimEnter' }, { once = true, callback = open_nvim_tree })
  end,
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, noremap = true, silent = true, nowait = true, buffer = bufnr }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', '<CR>', api.tree.change_root_to_node, opts('CD'))
      vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', 'O', api.node.run.system, opts('Run System'))
      vim.keymap.set('n', 'o', api.node.open.vertical, opts('Open Vertical Split'))
      vim.keymap.set('n', '<TAB>', api.node.open.horizontal, opts('Open Horizontal Split'))
      vim.keymap.set('n', ']', api.tree.expand_all, opts('Expand all'))
      vim.keymap.set('n', '[', api.tree.collapse_all, opts('Collapse all'))
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 's', api.tree.search_node, opts('Search'))
    end

    require('nvim-tree').setup({
      sync_root_with_cwd = true,
      view = {
        width = 30,
        adaptive_size = false,
        preserve_window_proportions = true,
      },
      sort = {
        sorter = 'case_sensitive',
      },
      filters = {
        git_ignored = true,
        dotfiles = true,
        exclude = { '.vscode', '.eslintrc.js', '.prettierrc.js' },
      },
      reload_on_bufenter = true,
      actions = {
        change_dir = {
          enable = false,
        },
        expand_all = {
          max_folder_discovery = 300,
        },
      },
      renderer = {
        root_folder_label = false,
        group_empty = true,
        highlight_git = true,
        highlight_diagnostics = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            git = {
              untracked = '?',
              staged = '+',
              unstaged = '~',
              deleted = '-',
              ignored = '',
            },
          },
        },
      },
      diagnostics = {
        enable = true,
      },
      modified = {
        enable = true,
        show_on_dirs = true,
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      on_attach = on_attach,
    })
  end,
}
