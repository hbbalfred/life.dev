return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.close,
            ['<C-h>'] = actions.select_horizontal,
            ['<C-x>'] = actions.delete_buffer,
          },
          n = {
            ['q'] = actions.close
          }
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<CR>')
    keymap.set('n', '<leader>sf', '<cmd>Telescope find_files<CR>')
    keymap.set('n', '<leader>sF', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>')
    keymap.set('n', '<leader>sg', '<cmd>Telescope live_grep<CR>')
    keymap.set('n', '<leader>ss', '<cmd>Telescope grep_string<CR>')
    keymap.set('n', '<leader>sh', '<cmd>Telescope help_tags<CR>')
    keymap.set('n', '<leader>sd', '<cmd>Telescope diagnostics<CR>')
  end,
}
