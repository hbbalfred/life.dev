local status, saga = pcall(require, 'lspsaga')
if not status then return end

saga.setup({
  move_in_saga = { prev = '<C-k>', next = '<C-j>' }
})
