return {
  "echasnovski/mini.files",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  keys = {
    { "<leader>o", function() require('mini.files').open() end, desc = "Mini files" }
  }
}
