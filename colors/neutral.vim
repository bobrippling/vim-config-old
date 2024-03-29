"%% SiSU Vim color file
" vim: ts=16 sw=16
" Fork of "Slate" Maintainer: Ralph Amissah <ralph@amissah.com>
" (originally looked at desert Hans Fugal <hans@fugal.net> http://hans.fugal.net/vim/colors/desert.vim (2003/05/06)
" modified by Rob

" :source $VIMRUNTIME/syntax/hitest.vim


set background=dark
highlight clear
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
let g:colors_name = "neutral"

" Colours:
" red green yellow blue magenta cyan white grey with light|dark
" listchars are "SpecialKey"

hi	Normal	guifg=White	guibg=grey15
hi	Cursor	guibg=khaki	guifg=slategrey
hi	VertSplit	guibg=#c2bfa5	guifg=grey40	gui=none	cterm=reverse
hi	Folded	ctermfg=DarkGrey	ctermbg=none

hi	ModeMsg	guifg=goldenrod	cterm=none	ctermfg=brown
hi	MoreMsg	guifg=SeaGreen	ctermfg=darkgreen
" V aka /^~$/ outside the buffer
"hi	NonText	guifg=RoyalBlue	guibg=grey15	cterm=bold	ctermfg=blue
hi	NonText	guifg=#4a4a59	guibg=grey15	cterm=bold	ctermfg=blue
hi	Question	guifg=springgreen	ctermfg=green
hi	Search	guibg=peru	guifg=wheat	cterm=none	ctermfg=black ctermbg=white
hi	IncSearch	guifg=green	guibg=black	cterm=none	ctermfg=black ctermbg=yellow
" V like the space+tab representations
"hi	SpecialKey	guifg=yellowgreen	ctermfg=darkgreen	cterm=none
hi	SpecialKey	guifg=#4a4a59	ctermfg=black	cterm=bold
hi	StatusLine	guibg=#c2bfa5	guifg=black	gui=none	cterm=underline
hi	StatusLineNC	guibg=#c2bfa5	guifg=grey40	gui=none	cterm=underline
hi	Title	guifg=gold	gui=bold	cterm=bold	ctermfg=yellow
"hi	Statement	guifg=CornflowerBlue	ctermfg=lightblue
hi	Statement	guifg=CornflowerBlue	ctermfg=yellow	cterm=bold
hi	Visual	gui=none	guifg=khaki	guibg=olivedrab	cterm=reverse
hi	WarningMsg	guifg=salmon	ctermfg=1
hi	String	guifg=SkyBlue	ctermfg=red	cterm=none
hi	Special	guifg=darkkhaki	ctermfg=red	cterm=none
" old comment (blue)
"hi	Comment	term=none	guifg=grey	ctermfg=cyan	cterm=bold
"hi	Comment	term=none	guifg=grey	ctermfg=black	cterm=bold
hi	Comment	term=none	guifg=grey	ctermfg=brown
" V NULL
hi	Constant	guifg=#ffa0a0	ctermfg=blue	cterm=bold
hi	Identifier	guifg=salmon	ctermfg=red
hi	Include	guifg=red	ctermfg=blue	cterm=bold
hi	PreProc	guifg=red	guibg=white	ctermfg=blue	cterm=bold
hi	Operator	guifg=Red	ctermfg=Red
hi	Define	guifg=gold	gui=bold	ctermfg=yellow
hi	Type	guifg=CornflowerBlue	ctermfg=2
hi	Function	guifg=navajowhite	ctermfg=brown
" V struct, enum
hi	Structure	guifg=green	ctermfg=green	cterm=bold
hi	LineNr	term=bold	cterm=NONE	ctermfg=DarkGrey	ctermbg=NONE	gui=NONE	guifg=DarkGrey	guibg=NONE
hi	Ignore	guifg=grey40	cterm=bold	ctermfg=7
hi	Todo	guifg=orangered	guibg=yellow2
hi	Directory	ctermfg=darkcyan
hi	ErrorMsg	cterm=bold	guifg=White	guibg=Red	cterm=bold	ctermfg=7	ctermbg=1
hi	VisualNOS	cterm=bold,underline
hi	WildMenu	ctermfg=0	ctermbg=3

hi DiffAdd cterm=none ctermfg=black ctermbg=green
hi DiffDelete cterm=none ctermfg=black ctermbg=red
hi DiffChange cterm=none ctermfg=black ctermbg=cyan
hi DiffText ctermfg=white ctermbg=cyan cterm=none

hi	Underlined	cterm=underline	ctermfg=5
hi	Error	guifg=White	guibg=Red	cterm=bold	ctermfg=7	ctermbg=1
hi	SpellErrors	guifg=White	guibg=Red	ctermfg=5	ctermbg=7
hi	ColorColumn	guifg=Grey	guibg=Grey	ctermbg=8

hi	Pmenu	ctermfg=0	ctermbg=6
hi	VertSplit	ctermfg=0	ctermbg=8


" DarkBlue Blue LightBlue
" DarkGreen Green LightGreen
" DarkCyan Cyan LightCyan
" DarkRed Red LightRed
" DarkMagenta Magenta LightMagenta
" Brown DarkYellow Yellow LightYellow
" LightGray LightGrey Gray Grey DarkGray DarkGrey
" Black White
