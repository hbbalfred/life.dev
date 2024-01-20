return {
  "mrcjkb/rustaceanvim",
  version = "^3",
  ft = { "rust" },
  init = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = require("hbb.utils.lsp").on_attach,
      }
    }
  end,
}
