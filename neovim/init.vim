"===============================

language en_US                                                                  "表示言語を英語に設定
" set nu                                                                          "行番号を表示
set number relativenumber                                                       "行番号を表示
set guifont=HackGenNerd\ Console:h12                                            "フォント設定。半角スペースは\でエスケープ。フォントサイズは:h～で設定
set clipboard+=unnamedplus                                                      "クリップボードをOSと共有する
set expandtab                                                                   "Tabキーでスペースを挿入。無効にするにはset noexpandtabを実行
set tabstop=2                                                                   "Tabキーのサイズ
set shiftwidth=2                                                                "インデントの見た目の空白数
set cursorline                                                                  "カーソルラインを有効(ellyのテーマで下線は表示されないように設定されているっぽい)
set list                                                                        "空白文字を可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:･          "特殊文字

autocmd FocusLost * echo "Focus Lost"
autocmd FocusGained * echo "Focus Gained"


let mapleader = "\<SPACE>"
"let mapleader = ","
"
set nowrap                                                                       "改行を折り返さない
set mouse=a                                                                      "マウスでクリックした箇所に移動

set ignorecase                                                                   "検索時に大文字小文字を区別しない
set smartcase                                                                    "検索文字列に大文字が含まれる場合は大文字小文字を区別して検索
set wrapscan                                                                     "末尾まで検索したら先頭から検索

set termguicolors                                                                "ターミナルのvimでもtrue colorを使用する

colorscheme osn

"===============================
"plugin list
call plug#begin('C:\Users\take\AppData\Local\nvim\plugged')
Plug 'https://github.com/vim-airline/vim-airline'           "vimの上下に表示されるステータスバー的なもの
Plug 'https://github.com/vim-airline/vim-airline-themes'    "airlineのテーマ
Plug 'https://github.com/preservim/nerdtree'                "ファイルツリー
Plug 'https://github.com/jeetsukumaran/vim-buffergator'     "Bufferユーティリティ
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"===============================
" plugin setting
"airlien
"テーマの種類は以下のSSを参照
"https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme = 'sol'                      "
let g:airline#extensions#tabline#enabled = 1        "画面上部にバッファを表示
let g:airline_powerline_fonts = 1                   "


"NerdTree
noremap <leader>n :NERDTreeFind<CR>
"Ctrl + nでNEDRTreeの表示・非表示を切り替える
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=3                                "フィアル・ブックマーク選択時にツリーを閉じる


"buffergator
let g:buffergator_viewport_split_policy="T"
let g:buffergator_hsplit_size=10


" coc
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline#extensions#coc#enabled = 0
let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<cr>

"===============================
"original keymap
noremap <silent><Leader>o o<Esc>0"_D
noremap <Leader>O O<Esc>0"_D
noremap <Leader>d S<ESC>
noremap <silent><Leader>c :bd<CR>

"" coc.nvim
""" <Tab>で候補をナビゲート
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
""" <Tab>で次、<S+Tab>で前
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"検索対象のハイライトを消す
noremap <Esc><Esc> :noh<CR>

"Alt + zで折り返しの有無を切り替える
noremap <A-z> :call ToggleWrap()<CR>
function ToggleWrap()
if (&wrap ==1)
    set nowrap
else
    set wrap
endif
endfunction


"Alt + nで折り返しの有無を切り替える
noremap <A-n> :call ToggleNum()<CR>
function ToggleNum()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

" ハイライトのグループ名を取得
map gm :call SynStack()<CR>
function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction

