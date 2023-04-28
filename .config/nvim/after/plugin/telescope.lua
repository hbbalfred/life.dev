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
        ['<C-h>'] = actions.select_horizontal,
        ['<C-x>'] = actions.delete_buffer,
      },
      n = {
        ['q'] = actions.close
      }
    }
  },
  pickers = {
    find_files = {
      hidden = false,
      no_ignore = false,
    }
  }
})

telescope.load_extension('fzf')
