"==================================================
"# initialize
set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "osn"


"==================================================
"# Function
"  memo
"    gui/cterm : 書体
"    guifg/ctermfg : 文字色
"    guibg/ctermbg : 背景色
function! s:setHi(group,guibg = "NONE",guifg = "NONE",gui = "NONE",ctermbg = "NONE",ctermfg = "NONE",cterm = "NONE")
  exe "hi " a:group "guibg=" a:guibg "guifg=" a:guifg "gui=" a:gui "ctermbg=" a:ctermbg "ctermfg=" a:ctermfg "cterm=" a:cterm
endfunction


"==================================================
"# color definition
let s:pl = {}
let s:pl.none = "NONE"
" let s:pl.fg01 = {"gui": "#","cui": "1"}
" let s:pl.fg03 = {"gui": "#4b545e","cui": "1"}
" let s:pl.fg04 = {"gui": "#38b48b","cui": "1"}
" let s:pl.fg05 = {"gui": "#8D7856","cui": "1"}

let s:pl.fg00 = {"gui": "#080808","cui": "1"}
let s:pl.fg01 = {"gui": "#8D7856","cui": "1"}
let s:pl.fg02 = {"gui": "#798362","cui": "1"}
let s:pl.fg03 = {"gui": "#696025","cui": "1"}
let s:pl.fg04 = {"gui": "#63768A","cui": "1"}
let s:pl.fg05 = {"gui": "#738C9C","cui": "1"}
let s:pl.fg06 = {"gui": "#6998B3","cui": "1"}
let s:pl.fg07 = {"gui": "#eeffff","cui": "1"}
let s:pl.fg08 = {"gui": "#868B8D","cui": "1"}
let s:pl.fg09 = {"gui": "#d7ce93","cui": "1"}

let s:pl.bg00 = {"gui": "#2E2F35","cui": "1"}
let s:pl.bg01 = {"gui": "#151A1E","cui": "1"}
let s:pl.bg02 = {"gui": "#14191F","cui": "1"}
let s:pl.bg03 = {"gui": "#2D3640","cui": "1"}
let s:pl.bg04 = {"gui": "#454545","cui": "1"}
let s:pl.bg05 = {"gui": "#d7ce93","cui": "1"}

let s:pl.fgomment  = {"gui": "#6A9955","cui": "1"}
let s:pl.error     = {"gui": "#764153","cui": "1"}
let s:pl.selection = {"gui": "#2c445b","cui": "1"}
let s:pl.diffg     = {"gui": "#012800","cui": "1"}
let s:pl.diffr     = {"gui": "#340001","cui": "1"}
let s:pl.fgdiffg   = {"gui": "#037500","cui": "1"}
let s:pl.fgdiffy   = {"gui": "#817E00","cui": "1"}
let s:pl.fgdiffr   = {"gui": "#810002","cui": "1"}
let s:pl.red       = {"gui": "#ff0000","cui": "1"}


"==================================================
"# highlight
"https://vim-jp.org/vimdoc-ja/syntax.html
call s:setHi("Normal"            ,s:pl.bg00.gui      ,s:pl.fg07.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "通常のテキスト
call s:setHi("NonText"           ,s:pl.none          ,s:pl.fg03.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "通常のテキスト以外

call s:setHi("LineNr"            ,s:pl.none          ,s:pl.fg03.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "行番号
call s:setHi("CursorLineNr"      ,s:pl.bg04.gui      ,s:pl.fg09.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "カレント行の行番号

call s:setHi("CursorLine"        ,s:pl.bg04.gui      ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "カレント行

call s:setHi("CursorColumn"      ,s:pl.bg04.gui      ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "カレント列
call s:setHi("ColorColumn"       ,s:pl.none          ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none) "colocoumnを設定した列の情報

call s:setHi("Conceal"           ,s:pl.none          ,s:pl.fgomment.gui ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "
call s:setHi("CursorLineConceal" ,s:pl.bg04.gui      ,s:pl.fgomment.gui ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "

call s:setHi("Function"          ,s:pl.none          ,s:pl.fg01.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "対となるカッコ等
call s:setHi("MatchParen"        ,s:pl.none          ,s:pl.fg07.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "

call s:setHi("Directory"         ,s:pl.none          ,s:pl.fg07.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "NERDTreeのフォルダ等

call s:setHi("Search"            ,s:pl.bg05.gui      ,s:pl.fg00.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "検索等


call s:setHi("htmlArg"           ,s:pl.none          ,"#9CDCFE"           ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "検索等
call s:setHi("htmlTag"           ,s:pl.none          ,"#808080"           ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "検索等
call s:setHi("htmlTagN"           ,s:pl.none         ,"#9CDCFE"           ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "検索等
call s:setHi("htmlTitle"         ,s:pl.none          ,"#eeffff"           ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "検索等
call s:setHi("htmlTagName"       ,s:pl.none          ,"#569CD6"           ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "検索等
call s:setHi("htmlString"        ,s:pl.none          ,"#CD8D8D"           ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)  "検索等



call s:setHi("Comment"           ,s:pl.none          ,s:pl.fgomment.gui ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none) "
call s:setHi("Constant"          ,s:pl.none          ,s:pl.fg03.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("DiffAdd"           ,s:pl.diffg.gui     ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("DiffChange"        ,s:pl.diffg.gui     ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("DiffDelete"        ,s:pl.diffr.gui     ,s:pl.diffr.gui    ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("DiffText"          ,s:pl.diffg.gui     ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("EndOfBuffer"       ,s:pl.none          ,s:pl.fg00.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Error"             ,s:pl.error.gui     ,s:pl.fg07.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("ErrorMsg"          ,s:pl.none          ,s:pl.error.gui    ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("FoldColumn"        ,s:pl.bg02.gui      ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Folded"            ,s:pl.bg02.gui      ,s:pl.bg00.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Identifier"        ,s:pl.none          ,s:pl.fg01.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Ignore"            ,s:pl.none          ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Keyword"           ,s:pl.none          ,s:pl.fg05.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("ModeMsg"           ,s:pl.none          ,s:pl.fg02.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Operator"          ,s:pl.none          ,s:pl.fg07.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Pmenu"             ,s:pl.selection.gui ,s:pl.fg07.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("PmenuSel"          ,s:pl.bg05.gui ,s:pl.fg07.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("PreProc"           ,s:pl.none          ,s:pl.fg03.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Question"          ,s:pl.none          ,s:pl.fg02.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("SignColumn"        ,s:pl.bg00.gui      ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Special"           ,s:pl.none          ,s:pl.fg05.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("SpellBad"          ,s:pl.none          ,s:pl.error.gui    ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("SpellCap"          ,s:pl.none          ,s:pl.fg01.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("SpellLocal"        ,s:pl.none          ,s:pl.fg01.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("SpellRare"         ,s:pl.none          ,s:pl.fg06.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Statement"         ,s:pl.none          ,s:pl.fg01.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("StatusLine"        ,s:pl.bg02.gui      ,s:pl.fg07.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("StatusLineNC"      ,s:pl.bg02.gui      ,s:pl.bg00.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("String"            ,s:pl.none          ,s:pl.fg02.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Structure"         ,s:pl.none          ,s:pl.fg03.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("TabLine"           ,s:pl.bg03.gui      ,s:pl.fg08.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("TabLineSel"        ,s:pl.bg01.gui      ,s:pl.fg00.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("TabLineFill"       ,s:pl.bg00.gui      ,s:pl.fg00.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Title"             ,s:pl.none          ,s:pl.fg04.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Todo"              ,s:pl.none          ,s:pl.fg01.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Type"              ,s:pl.none          ,s:pl.fg03.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Underlined"        ,s:pl.none          ,s:pl.fg01.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("VertSplit"         ,s:pl.none          ,s:pl.fgomment.gui ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("Visual"            ,s:pl.selection.gui ,s:pl.none         ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("WarningMsg"        ,s:pl.none          ,s:pl.error.gui    ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("WildMenu"          ,s:pl.bg01.gui      ,s:pl.fg00.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
call s:setHi("qfLineNr"          ,s:pl.none          ,s:pl.fg01.gui     ,s:pl.none ,s:pl.none ,s:pl.none ,s:pl.none)
