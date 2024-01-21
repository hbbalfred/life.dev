return {
  "mrcjkb/rustaceanvim",
  version = "^3",
  ft = { "rust" },
  init = function()
    -- Update this path
    local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
    local cfg = require('rustaceanvim.config')
    vim.g.rustaceanvim = {
      server = {
        on_attach = require("hbb.utils.lsp").on_attach,
      },
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
      }
    }
  end,
}
