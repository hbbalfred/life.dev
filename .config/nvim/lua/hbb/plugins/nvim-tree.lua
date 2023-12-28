return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
        custom = { ".DS_Store" }
      },
      view = {
        adaptive_size = true,
        relativenumber = true,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
    })
  end,
}
