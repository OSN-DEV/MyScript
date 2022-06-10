"===============================
"basic setting
language en_US                                                                  "表示言語を英語に設定
set nu                                                                          "行番号を表示
set guifont=HackGenNerd\ Console:h12                                            "フォント設定。半角スペースは\でエスケープ。フォントサイズは:h～で設定
set clipboard+=unnamedplus                                                      "クリップボードをOSと共有する
set expandtab                                                                   "Tabキーでスペースを挿入。無効にするにはset noexpandtabを実行
set tabstop=4                                                                   "Tabキーのサイズ
set shiftwidth=4                                                                "インデントの見た目の空白数
set cursorline                                                                  "カーソルラインを有効(ellyのテーマで下線は表示されないように設定されているっぽい)
set list                                                                        "空白文字を可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:･          "特殊文字

let mapleader = "\<SPACE>"
"let mapleader = ","
"
set nowrap                                                                       "改行を折り返さない
set mouse=a                                                                      "マウスでクリックした箇所に移動

set ignorecase                                                                   "検索時に大文字小文字を区別しない
set smartcase                                                                    "検索文字列に大文字が含まれる場合は大文字小文字を区別して検索
set wrapscan                                                                     "末尾まで検索したら先頭から検索

set termguicolors                                                                "ターミナルのvimでもtrue colorを使用する

"===============================
"plugin 
call plug#begin('C:\Users\take\AppData\Local\nvim\plugged')
Plug 'https://github.com/vim-airline/vim-airline'           "vimの上下に表示されるステータスバー的なもの
Plug 'https://github.com/vim-airline/vim-airline-themes'    "airlineのテーマ
Plug 'https://github.com/preservim/nerdtree'                "ファイルツリー
Plug 'https://github.com/jeetsukumaran/vim-buffergator'
'Plug 'https://github.com/tinyheero/vim-myhelp.git'
call plug#end()




"===============================
"color theme
colorscheme osn
"colorscheme elly                                 "
"colorscheme gruvbox                                 "



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



"===============================
"original keymap
noremap <Leader>o o<Esc>0"_D
noremap <Leader>O O<Esc>0"_D
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

