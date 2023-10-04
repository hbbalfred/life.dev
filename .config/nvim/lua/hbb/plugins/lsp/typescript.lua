return {
  "pmizio/typescript-tools.nvim",
  ft = { "javascript", "typescript", },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("typescript-tools").setup({
      on_attach = require("hbb.plugins.lsp.shared.config").on_attach
    })
  end,
}
