return {
  "pmizio/typescript-tools.nvim",
  ft = { "javascript", "typescript", },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    on_attach = require("hbb.plugins.lsp.shared.config").on_attach
  },
}
