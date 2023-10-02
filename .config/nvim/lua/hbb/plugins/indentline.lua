return {
  'lukas-reineke/indent-blankline.nvim',-- Add indentation guides even on blank lines
  main = "ibl",
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()

    local ibl = require('ibl')
    ibl.setup({
      indent = { char = '┊' }
    })

  end
}


