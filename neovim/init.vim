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
Plug 'github:OSN-DEV/elly.vim.git'                          "カラーテーマ(ターミナルが16進数を使えない場合、ターミナルとGUIはどちらか一方にしか使用できない)
Plug 'github:OSN-DEV/morhetz/gruvbox'                       "カラーテーマ
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
"noremap <leader>n :NERDTreeFocus<CR>
noremap <leader>n :NERDTreeFind<CR>
noremap <C-n> :NERDTreeToggle<CR>                       "Ctrl + nでNEDRTreeの表示・非表示を切り替える
let NERDTreeQuitOnOpen=3                                "フィアル・ブックマーク選択時にツリーを閉じる



"===============================
"original color
"highlight lineNr ctermfg=101        "ターミナルだと常に明るい黄色なので色を変更
"hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None             "eol, extends,preceds
"hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=None             "nbsp,tab,trail
"hi Normal ctermbg=None ctermfg=59 guibg=#282E37 guifg=None                 "通常のテキスト
"hi EndOfBuffer ctermbg=None ctermfg=59 guibg=NONE guifg=None                 "通常のテキスト
"hi Normal guibg=gray14
"hi LineNr ctermfg=94
"hi VertSplit guibg=#0c0c0c
"hi Special guibg=#0c0c0c
"hi Identifier guibg=#0c0c0c


"===============================
"original keymap
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D
"noremap! <A-o>: o<Esc>
noremap <Esc><Esc> : nohlsearch<Esc>                "検索対象のハイライトを消す

noremap <A-z> :call ToggleWrap()<CR>                "Alt + zで折り返しの有無を切り替える
function ToggleWrap()
    if (&wrap ==1)
        set nowrap
    else
        set wrap
    endif
endfunction

