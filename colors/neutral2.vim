"%% SiSU Vim color file
" Fork of "Slate" Maintainer: Ralph Amissah <ralph@amissah.com>
" (originally looked at desert Hans Fugal <hans@fugal.net> http://hans.fugal.net/vim/colors/desert.vim (2003/05/06)
" modified by Rob

hi clear

set background=dark
if version > 580 && exists("syntax_on")
	syntax reset
endif
let g:colors_name = "neutral2"

hi clear

" Colours:
" red green yellow blue magenta cyan white grey with light|dark

hi Normal guifg=White guibg=grey15
hi Cursor guibg=khaki guifg=slategrey
hi VertSplit ctermfg=0 ctermbg=8
hi Pmenu ctermfg=0 ctermbg=6
hi Folded guibg=black guifg=grey40 ctermfg=grey ctermbg=darkgrey
hi FoldColumn guibg=black guifg=grey20 ctermfg=4 ctermbg=7
hi IncSearch guifg=green guibg=black cterm=none ctermfg=yellow ctermbg=green
hi ModeMsg guifg=goldenrod cterm=none ctermfg=brown
hi MoreMsg guifg=SeaGreen ctermfg=darkgreen

hi NonText guifg=#4a4a59 guibg=grey15 cterm=bold ctermfg=blue
hi Question guifg=springgreen ctermfg=green
hi Search guibg=peru guifg=wheat cterm=none ctermfg=darkblue ctermbg=green
hi SpecialKey guifg=#4a4a59 ctermfg=black cterm=bold
hi StatusLine guibg=#c2bfa5 guifg=black gui=none cterm=underline
hi StatusLineNC guibg=#c2bfa5 guifg=grey40 gui=none cterm=underline
hi Title guifg=gold gui=bold cterm=bold ctermfg=yellow
hi Statement guifg=CornflowerBlue ctermfg=yellow cterm=bold
hi Visual gui=none guifg=khaki guibg=olivedrab cterm=reverse
hi VisualNOS cterm=bold,underline
hi WarningMsg guifg=salmon ctermfg=1
hi String guifg=SkyBlue ctermfg=red cterm=none
hi Special guifg=darkkhaki ctermfg=red cterm=none
hi Comment term=none guifg=grey ctermfg=brown

hi Constant guifg=#ffa0a0 ctermfg=blue cterm=bold
hi Identifier guifg=salmon ctermfg=red
hi Include guifg=red ctermfg=blue cterm=bold
hi PreProc guifg=red guibg=white ctermfg=blue cterm=bold
hi Operator guifg=Red ctermfg=Red
hi Define guifg=gold gui=bold ctermfg=yellow
hi Type guifg=CornflowerBlue ctermfg=2
hi Function guifg=navajowhite ctermfg=brown
hi Structure guifg=green ctermfg=green cterm=bold
hi Keyword ctermfg=111 cterm=bold

hi LineNr guifg=grey50 ctermfg=3
hi Ignore guifg=grey40 cterm=bold ctermfg=7
hi Todo guifg=orangered guibg=yellow2
hi Directory ctermfg=darkcyan
hi ErrorMsg cterm=bold guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
hi WildMenu ctermfg=0 ctermbg=3
hi DiffAdd ctermbg=4
hi DiffChange ctermbg=5
hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
hi DiffText cterm=bold ctermbg=1
hi Underlined cterm=underline ctermfg=5
hi Error guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
hi SpellErrors guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
hi ColorColumn guifg=Grey guibg=Grey ctermbg=8


" 1 red  | 2 green | 3 yellow | 4 blue
" 5 pink | 6 cyan  | 7 white  | 8 grey
