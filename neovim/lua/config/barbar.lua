local status, plugin = pcall(require, 'barbar')
if (not status) then
    print('barbar is not installed')
    return
end

plugin.setup {}
vim.keymap.set('n', '<A-,>', '<cmd>BufferPrevious<cr>')      -- 前のバッファ
vim.keymap.set('n', '<A-.>', '<cmd>BufferNext<cr>')          -- 次のバッファ
vim.keymap.set('n', '<A-c>', '<cmd>BufferClose<cr>')         -- バッファを閉じる

