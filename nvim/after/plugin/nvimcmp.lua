local status, cmp = pcall(require, 'cmp')
if not status then return end

local status, luasnip = pcall(require, 'luasnip')
if not status then return end

vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
  snippet = {
    extend = function(args)
      luasnip.lsp_extend(args.body)
    end
  }
})
