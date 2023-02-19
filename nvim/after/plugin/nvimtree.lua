local status, nvimtree = pcall(require, 'nvim-tree')
if not status then return end

-- see https://github.com/nvim-tree/nvim-tree.lua
--
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  view = {
    mappings = {
      list = {
        { key = 's', action = '' }
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      }
    }
  }
})
