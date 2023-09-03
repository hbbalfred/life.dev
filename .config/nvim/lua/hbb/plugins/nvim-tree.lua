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
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          }
        }
      },
      filters = {
        dotfiles = false,
        custom = { '^.git$', '\\.meta$', '.DS_Store' },
      },
      git = {
        ignore = false
      }
    })

    -- nvim-tree
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })

    -- @see https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
    local function open_nvim_tree(data)

      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1

      if not directory then
        return
      end

      -- change to the directory
      vim.cmd.cd(data.file)

      -- open the tree
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end
}
