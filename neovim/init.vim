"===============================
"basic setting
language en_US                          "表示言語を英語に設定
set nu                                  "行番号を表示
set guifont=HackGenNerd\ Console:h12    "フォント設定。半角スペースは\でエスケープ。フォントサイズは:h～で設定
set clipboard+=unnamedplus              "クリップボードをOSと共有する
set expandtab                           "Tabキーでスペースを挿入。無効にするにはset noexpandtabを実行
set tabstop=4                           "Tabキーのサイズ
set shiftwidth=4                        "インデントの見た目の空白数
set cursorline                          "カーソルラインを有効(ellyのテーマで下線は表示されないように設定されているっぽい)
set list                                "空白文字を可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:･
let mapleader = "\<SPACE>"
"let mapleader = ","
set nowrap                              "改行を折り返さない
set mouse=a                             "マウスでクリックした箇所に移動

set ignorecase                          "検索時に大文字小文字を区別しない
set smartcase                           "検索文字列に大文字が含まれる場合は大文字小文字を区別して検索
set wrapscan                            "末尾まで検索したら先頭から検索

"===============================
"plugin 
call plug#begin('C:\Users\take\AppData\Local\nvim\plugged')
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ulwlu/elly.vim'
call plug#end()




"===============================
"elly
colorscheme elly                    "カラーテーマを設定
let g:lightline = {'colorscheme': 'elly', }



"airlien
let g:airline_theme = 'wombat'                      "テーマ
"let g:airline_theme = 'elly'                      "テーマ
let g:airline#extensions#tabline#enabled = 1        "
let g:airline_powerline_fonts = 1                   "



"NerdTree
noremap <leader>n :NERDTreeFocus<CR>
noremap <C-n> :NERDTreeToggle<CR>                       "Ctrl + nでNEDRTreeの表示・非表示を切り替える
let NERDTreeQuitOnOpen=3                                "フィアル・ブックマーク選択時にツリーを閉じる



"===============================
"original color
highlight lineNr ctermfg=101        "ターミナルだと常に明るい黄色なので色を変更
hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None             "eol, extends,preceds
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=None             "nbsp,tab,trail
"hi Normal ctermbg=None ctermfg=59 guibg=#0C0C0C guifg=None                 "通常のテキスト
"hi EndOfBuffer ctermbg=None ctermfg=59 guibg=NONE guifg=None                 "通常のテキスト
hi Normal guibg=#0f0f0f
hi LineNr guibg=#0c0c0c
hi VertSplit guibg=#0c0c0c
hi Special guibg=#0c0c0c
hi Identifier guibg=#0c0c0c



"===============================
"original keymap
noremap j gj            "複数行表示でも普通に移動させる
noremap k gk            "同上
noremap <Esc><Esc> : nohlsearch<CR><Esc>            "検索対象のハイライトを消す

noremap <A-z> :call ToggleWrap()<CR>            "Alt + zで折り返しの有無を切り替える
function ToggleWrap()
    if (&wrap ==1)
        set nowrap
    else
        set wrap
    endif
endfunction

