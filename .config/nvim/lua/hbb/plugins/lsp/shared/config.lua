local M = {}

M.on_attach = function(client, bufnr)
  -- https://github.com/NvChad/NvChad/blob/v2.0/lua/plugins/configs/lspconfig.lua
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  local keymap = vim.keymap   -- for conciseness

  local opts = { noremap = true, silent = true }
  opts.buffer = bufnr

  -- set keybinds
  opts.desc = "Show LSP references"
  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
  opts.desc = "Show LSP definitions"
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
  opts.desc = "Show LSP implementations"
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
  opts.desc = "Show LSP type definitions"
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

  opts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  opts.desc = "Rename without select"
  keymap.set("n", "<leader>rrn", vim.lsp.buf.rename, opts) -- smart rename
  opts.desc = "Rename within select"
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

  opts.desc = "Show buffer diagnostics"
  keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
  opts.desc = "Show LSP signature"
  keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

  opts.desc = "Hierarchy incoming calls"
  keymap.set("n", "<leader>vi", "<cmd>Lspsaga incoming_calls<CR>", opts) -- https://nvimdev.github.io/lspsaga/callhierarchy/
  opts.desc = "Hierarchy outgoing calls"
  keymap.set("n", "<leader>vc", "<cmd>Lspsaga outgoing_calls<CR>", opts) -- https://nvimdev.github.io/lspsaga/callhierarchy/
  opts.desc = "Outline"
  keymap.set("n", "<leader>vo", "<cmd>Lspsaga outline<CR>", opts) -- https://nvimdev.github.io/lspsaga/outline/
  opts.desc = "Finder"
  keymap.set("n", "<leader>vf", "<cmd>Lspsaga finder<CR>", opts) -- https://nvimdev.github.io/lspsaga/finder/

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts) -- mapping to restart lsp if necessary

  opts.desc = "Format current buffer with LSP"
  keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, opts)
end

return M