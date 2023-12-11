vim.cmd('autocmd!') -- remove all of autocmd

-- encoding, compatible for vim
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- number lines
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.smartindent = true

-- other accessibilities
vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 4
vim.opt.shell = '/bin/zsh'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.cursorline = true
vim.opt.iskeyword:append('-')
-- clipboard
if vim.fn.has('macunix') == 1 then
  vim.opt.clipboard:append('unnamedplus')
end
if vim.fn.has('win32') == 1 then
  vim.opt.clipboard:prepend{'unnamedplus', 'unnamedplus'}
end

-- appearance
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste'
})
