-- https://github.com/hadronized/hop.nvim
local status, plugin = pcall(require, 'hop')
if (not status) then
    print('hop is not installed')
    return
end

plugin.setup {}
vim.keymap.set('n', '<Leader>hc', '<cmd>HopChar1<cr>')      -- 単一の文字検索
vim.keymap.set('n', '<Leader>hw', '<cmd>HopWord<cr>')       -- 単語検索
vim.keymap.set('n', '<Leader>hl', '<cmd>HopLine<cr>')       -- ライン検索
vim.keymap.set('n', '<Leader>hp', '<cmd>HopPattern<cr>')    -- キーワード検索(キーワードを自分で入力)

