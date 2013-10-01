" Based off:
" Maintainer: Hans Fugal <hans@fugal.net>
" Last Change: 5 Oct 2001
" URL: http://fugal.net/vim/colors/bw.vim

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

hi clear
syntax reset
let g:colors_name="blank"

" off
hi Directory ctermfg=NONE
hi ErrorMsg ctermfg=NONE
hi MoreMsg ctermfg=NONE
hi ModeMsg ctermfg=NONE
hi Question ctermfg=NONE
hi Title ctermfg=NONE
hi VisualNOS ctermfg=NONE
hi WarningMsg ctermfg=NONE
hi Folded ctermfg=NONE
hi FoldColumn ctermfg=NONE
hi Constant ctermfg=NONE
hi Identifier ctermfg=NONE
hi Statement ctermfg=NONE
hi PreProc ctermfg=NONE
hi Type ctermfg=NONE
hi Underlined ctermfg=NONE
hi Todo ctermfg=black ctermbg=yellow

" status/menus
hi StatusLine cterm=underline
hi StatusLineNC cterm=underline

hi Pmenu ctermfg=0 ctermbg=6
hi PmenuSel ctermfg=6 ctermbg=0
hi VertSplit ctermfg=0 ctermbg=8
hi WildMenu ctermfg=0 ctermbg=3

" 'nu'
hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE

" errors
hi Error cterm=bold ctermfg=7 ctermbg=1
hi SpellErrors ctermfg=5 ctermbg=7
hi ColorColumn ctermbg=8

" strings + comments
hi Comment ctermfg=brown
hi String ctermfg=1

" search
hi IncSearch cterm=none ctermfg=black ctermbg=white
hi Search cterm=none ctermfg=black ctermbg=white

" visual
hi Visual ctermfg=NONE ctermfg=black ctermbg=darkcyan

" invisibles
hi SpecialKey ctermfg=black cterm=bold
hi NonText cterm=bold ctermfg=blue

" e.g. format strings and escapes
hi Special cterm=bold

" diff
hi DiffAdd ctermbg=6 ctermfg=0
hi DiffChange ctermbg=8
hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
hi DiffText cterm=bold ctermbg=0

" ctrlp
hi CtrlPMatch term=underline cterm=bold ctermfg=1
