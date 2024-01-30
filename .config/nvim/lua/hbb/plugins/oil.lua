return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function ()
    vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>")
  end,
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        return name == ".DS_Store" or name == ".git"
      end
    }
  },
}
