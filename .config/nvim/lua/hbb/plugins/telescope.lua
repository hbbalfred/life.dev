return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = telescope.extensions.file_browser.actions

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-q>'] = actions.close,
            ['<C-h>'] = actions.select_horizontal,
            ['<C-x>'] = actions.delete_buffer,
            ['<C-n>'] = fb_actions.create,
            ['<C-d>'] = fb_actions.remove,
            ['<C-r>'] = fb_actions.rename,
          },
          n = {
            ['q'] = actions.close
          }
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          grouped = true,
          respect_gitignore = false,
          hidden = true,
        }
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<CR>')
    keymap.set('n', '<leader>sf', '<cmd>Telescope find_files<CR>')
    keymap.set('n', '<leader>sF', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>')
    keymap.set('n', '<leader>sg', '<cmd>Telescope live_grep<CR>')
    keymap.set('n', '<leader>ss', '<cmd>Telescope grep_string<CR>')
    keymap.set('n', '<leader>sh', '<cmd>Telescope help_tags<CR>')
    keymap.set('n', '<leader>sd', '<cmd>Telescope diagnostics<CR>')

    -- set keymaps for file browser
    keymap.set('n', '<leader>e', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>')
  end,
}
