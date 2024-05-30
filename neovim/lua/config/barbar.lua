local status, plugin = pcall(require, 'barbar')
if (not status) then
    print('barbar is not installed')
    return
end

plugin.setup {}
vim.keymap.set('n', '<A-,>', '<cmd>BufferPrevious<cr>')      -- 単一の文字検索
vim.keymap.set('n', '<A-.>', '<cmd>BufferNext<cr>')      -- 単一の文字検索

