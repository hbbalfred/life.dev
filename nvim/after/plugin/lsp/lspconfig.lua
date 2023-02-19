local status, lspconfig = pcall(require, 'lspconfig')
if not status then return end

local status2, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status2 then return end

-- Enable keybinds for available LSP server
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Set keybinds
  vim.keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
  vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
