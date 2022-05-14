"===============================
"basic setting
language en_US				            "表示言語を英語に設定
set nu                      		    "行番号を表示
set guifont=HackGenNerd\ Console:h12	"フォント設定。半角スペースは\でエスケープ。フォントサイズは:h～で設定
set clipboard+=unnamedplus		        "クリップボードをOSと共有する
set expandtab				            "Tabキーでスペースを挿入。無効にするにはset noexpandtabを実行
set tabstop=4				            "Tabキーのサイズ
set shiftwidth=4			            "インデントの見た目の空白数





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
colorscheme elly             "カラーテーマを設定
let g:lightline = {'colorscheme': 'elly', }




"airlien
let g:airline_theme = 'wombat'                      "テーマ
"let g:airline_theme = 'elly'                      "テーマ
let g:airline#extensions#tabline#enabled = 1        "
let g:airline_powerline_fonts = 1                   "


"NerdTree
map <C-n> :NERDTreeToggle<CR>                       "Ctrl + nでNEDRTreeの表示・非表示を切り替える



