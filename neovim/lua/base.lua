local opt = vim.opt

vim.api.nvim_exec('language en_US', true)           -- 言語設定
vim.g.mapleader = " "                               -- Leader

vim.g.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true                                -- 行番号表示
vim.wo.relativenumber = true                        -- 行番号の相対表示

opt.title = true                                -- ターミナルウィンドウのタイトルを変更する
opt.autoindent = true                           --  
opt.hlsearch = true                             -- 検索結果のハイライト
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2                              -- ステータスラインの表示(2=常に表示)
opt.expandtab = true                            -- タブをスペースに変換
opt.tabstop = 2                                 -- 2 spaces for tabs
opt.shiftwidth = 2                              -- 2 spaces for indent width
opt.scrolloff = 2                               -- カーソルが上下にきたときの余す行数

opt.inccommand = 'split'                        -- 文字列置換をインタラクティブに表示する
opt.ignorecase = true               -- ignore case when searching
opt.smartcase = true                -- if you include mixed case in your search, assumes you want case-sensitive
opt.smarttab = true
opt.breakindent = true
opt.ai = true
opt.si = true
opt.wrap = false
opt.backspace = 'start,eol,indent'
opt.path: append { '**' }
opt.wildignore: append { '*/node_modules/*'}

opt.listchars = { space = '･', tab = '»-', trail = '-', eol = '↲', extends = '»', precedes = '«', nbsp = '%' }    -- 制御文字の設定
opt.list = true                           -- 制御文字の表示

opt.cursorline = true     -- カレント行の強調
opt.cursorcolumn = true     -- カレント行の強調
opt.termguicolors = true  -- trueにするとguifg/guibgのみ使用される(guiは使用されずctermの指定が有効になる)

opt.background = "dark"
opt.signcolumn = "yes"      -- show sign column so that text doesn't shift



-- vim標準のファイラーを無効にする(nvim treeおすすめ)
vim.g.loaded_netrw = 3
-- vim.g.loaded_netrwPlugin = 1

opt.splitright = true   -- split vertical window to the right
opt.splitbelow = true   -- split horizontal window to the bottom


-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = 'set nopaste'
})

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }




