local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then return end

treesitter.setup({
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  auto_install = false,
  ensure_installed = {
    'bash',
    'css',
    'gitignore',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'typescript',
    'vim',
  },
})
