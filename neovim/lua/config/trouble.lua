local status, plugin = pcall(require, 'trouble')
if (not status) then
    print('trouble is not installed')
    return
end

local opts = { noremap = true, silent = false }
vim.keymap.set('n', '<Leader>xx', '<cmd>TroubleToggle<cr>', opts)
vim.keymap.set('n', '<Leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
vim.keymap.set('n', '<Leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
vim.keymap.set('n', '<Leader>xq', '<cmd>TroubleToggle quickfix<cr>', opts)
vim.keymap.set('n', '<Leader>xl', '<cmd>TroubleToggle loclist<cr>', opts)

plugin.setup({})