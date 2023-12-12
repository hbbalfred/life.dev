return {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "rust-lang/rust.vim",
  },
  init = function()
    vim.g.rustfmt_autosave = 1
  end,
  opts = {
    server = {
      on_attach = require("hbb.plugins.lsp.shared.config").on_attach
    }
  },
}
