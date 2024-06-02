local status, plugin = pcall(require, 'nvim-autopairs')
if (not status) then
    print('nvim-autopairs is not installed')
    return
end

plugin.setup({
    check_ts = true,            -- enabled treesitter
    ts_config = {
        lua = { "string" },     -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" },     -- don't add pairs in javascript template_treesitter nodes
        java = false,                           -- don't check treesitter on java
    },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
