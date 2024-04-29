vim.api.nvim_exec('language en_US', true)           -- 言語設定
vim.g.mapleader = " "                               -- Leader

vim.g.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true                                -- 行番号表示
vim.wo.relativenumber = true                        -- 行番号の相対表示

vim.opt.title = true                                -- ターミナルウィンドウのタイトルを変更する
vim.opt.autoindent = true                           --  
vim.opt.hlsearch = true                             -- 検索結果のハイライト
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2                              -- ステータスラインの表示(2=常に表示)
vim.opt.expandtab = true                            -- タブをスペースに変換
vim.opt.scrolloff = 2                               -- カーソルが上下にきたときの余す行数

vim.opt.inccommand = 'split'                        -- 文字列置換をインタラクティブに表示する
vim.opt.ignorecase = true               
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.path: append { '**' }
vim.opt.wildignore: append { '*/node_modules/*'}

vim.opt.listchars = { space = '･', tab = '»-', trail = '-', eol = '↲', extends = '»', precedes = '«', nbsp = '%' }    -- 制御文字の設定
vim.opt.list = true                           -- 制御文字の表示

-- vim標準のファイラーを無効にする(nvim treeおすすめ)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = 'set nopaste'
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }




