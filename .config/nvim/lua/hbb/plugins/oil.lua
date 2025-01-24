return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    -- vim.keymap.set("n", "<leader>o", "<CMD>Oil --float<CR>")
  end,
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        return name == ".DS_Store" or name == ".git"
      end,
    },
    keymaps = {
      ["<C-q>"] = { "actions.close", mode = "n" },
    }

  },
}
