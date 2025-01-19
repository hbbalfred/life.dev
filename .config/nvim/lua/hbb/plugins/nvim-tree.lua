return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
  end,
  config = function()
    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      hijack_directories = {
        enable = false,
      },
      filters = {
        dotfiles = false,
        custom = { ".DS_Store" },
        exclude = { ".env*", "node_modules/*" }
      },
      view = {
        adaptive_size = true,
        relativenumber = true,
        width = { min = 32, max = 36 }
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
