local status, lualine = pcall(require, 'lualine')
if not status then return end

lualine.setup({
  options = {
    icons_enable = true,
    theme = 'gruvbox_dark',
    component_separators = '|',
    section_separators = '',
  }
})
