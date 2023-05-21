vim.cmd('autocmd!')                         -- autocmdの多重登録を防ぐ(現状はデフォルトで無効になっているので、なくてもよいらしい)
vim.cmd('colorscheme osn')                  -- カラーテーマ
vim.api.nvim_exec('language en_US', true)   -- 言語設定
vim.g.mapleader = " "                       -- <Leader>の設定

vim.g.encoding = 'uft-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'uft-8'

vim.wo.number = true                        -- 行番号表示
vim.wo.relativenumber = true                -- 行番号の相対表示
vim.opt.guifont = { 'HackGenNerd Console', ":h12" }

vim.opt.expandtab = true                    -- タブをスペース変換
vim.opt.shiftwidth = 2                      -- インデントのスペース
vim.opt.tabstop = 2                         -- タブの幅


vim.opt.listchars = { space = '･', tab = '»-', trail = '-', eol = '↲', extends = '»', precedes = '«', nbsp = '%' }    -- 制御文字の設定
vim.opt.list = true                           -- 制御文字の表示