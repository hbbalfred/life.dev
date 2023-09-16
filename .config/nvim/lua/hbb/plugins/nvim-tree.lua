return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()

    local nvimtree = require('nvim-tree')

    -- see https://github.com/nvim-tree/nvim-tree.lua
    --
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        relativenumber = true,
      },
      -- disable window_picker for explorer to work well with window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          }
        }
      },
      filters = {
        custom = { '^.git$', '\\.meta$', '.DS_Store' },
      },
      git = {
        ignore = false
      }
    })

    -- nvim-tree
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
  end
}
