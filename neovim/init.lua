require('base')
require('keymaps')
require('lazy_vim')


-- vim.fn → VimのスクリプトからLuaの関数を呼び出すのに使用
-- has → 指定された機能やオプションがvimで利用可能かを確認
local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"
--
-- クリップボードの設定
if is_mac then
  vim.opt.clipboard:append{ 'unnamedplus'}
end
if is_win  then
  vim.opt.clipboard:append{ 'unnamed', 'unnamedplus'}
end

if vim.g.vscode then
    -- VS Code extension
else 
    -- ordinary Neovim
end
