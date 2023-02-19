local status, mason = pcall(require, 'mason')
if not status then return end

local status, lspconfig = pcall(require, 'mason-lspconfig')
if not status then return end

local status, neodev = pcall(require, 'neodev')
if not status then return end

local status, fidget = pcall(require, 'fidget')
if not status then return end

neodev.setup()
fidget.setup()

mason.setup({})

lspconfig.setup({
  ensure_installed = { 'lua_ls', 'tsserver' }
})
