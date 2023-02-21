local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then return end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},-- it will not add a pair on that treesitter node
    javascript = {'template_string'},
    java = false,-- don't check treesitter on java
  }
})

-- Compatible for nvim-cmp
--
local status, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not status then return end
local status, cmp = pcall(require, 'cmp')
if not status then return end
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())
