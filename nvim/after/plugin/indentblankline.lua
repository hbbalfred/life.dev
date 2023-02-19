local status, indentblankline = pcall(require, 'indent_blankline')
if not status then return end

indentblankline.setup({
  char = '┊',
  show_trailing_blankline_indent = false,
})
