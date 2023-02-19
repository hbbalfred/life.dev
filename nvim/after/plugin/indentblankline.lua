local status, indentblankline = pcall(require, 'indent_blankline')
if not status then return end

indentblankline.setup({
  -- char = '|',
  -- char = '¦',
  -- char = '┆',
  char = '┊',
  show_trailing_blankline_indent = false,
  show_end_of_line = true,

  -- need nvim-treesitter for context
  -- show_current_context = true,
  -- show_current_context_start = true,
})

-- Disable colors of this plugin to prevent weird displaying
vim.cmd('highlight IndentBlanklineChar guifg=NONE gui=nocombine')
vim.cmd('highlight IndentBlanklineSpaceChar guifg=NONE gui=nocombine')
vim.cmd('highlight IndentBlanklineSpaceCharBlankline guifg=NONE gui=nocombine')
