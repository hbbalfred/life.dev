local status, _ = pcall(require, 'gruvbox')
if not status then print('Colorshceme not found') return end

vim.cmd('colorscheme gruvbox')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE') -- transparent background
