local status, gruvbox = pcall(require, 'gruvbox')
if not status then print('Colorshceme not found') return end

-- Ensure background is transparent
gruvbox.setup({
  transparent_mode = true
})

vim.cmd('colorscheme gruvbox')
