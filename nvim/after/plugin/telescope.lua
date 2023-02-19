local status, telescope = pcall(require, 'telescope')
if not status then return end

local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-q>'] = actions.close,
      },
      n = {
        ['q'] = actions.close
      }
    }
  }
})

telescope.load_extension('fzf')
