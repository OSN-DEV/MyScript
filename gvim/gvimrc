" 参考
" https://d-ebi.hatenablog.com/entry/2018/11/08/210000

set guifont=Ricty\ Diminished:h12:cSHIFTJIS                     " フォント設定

set cursorline                                                  " 現在の行を強調表示
highlight cursorline gui=underline guifg=blue guibg=NONE        " 行選択ではなくアンダーライン表示にする(文字色＝アンダーラインの色)

" 右スクロールバー非表示
" set guioptions-=r
" set guioptions-=R

set guioptions-=T                                           " ツールバー非表示
set guioptions-=m                                           " メニュー非表示
set guioptions-=l                                           " 左スクロールバーを非表示
set guioptions-=L                                           " 同上

set shiftwidth=4                                            " 自動挿入時や>をしたときのインデントの深さ
set tabstop=4                                               " タブの画面上での幅

colorscheme molokai                                         " https://github.com/tomasr/molokai

map <C-n> :NERDTreeToggle<CR>                               " Ctrl + nでツリーを表示
let g:NERDTreeQuitOnOpen = 1								" NERDtreeを自動で閉じる

" IME の on/off に合わせてカーソルの色を変える
if has('multi_byte_ime')
"    hi Cursor guifg=bg guibg=Green gui=NONE                " ノーマルモードの色もグリーンになるので一旦コメント
    hi CursorIM guifg=NONE guibg=Red gui=NONE
endif

" Windowsのサイズを記憶する
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif
