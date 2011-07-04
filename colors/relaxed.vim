" Vim color file
" Maintainer:    Hiltjo Posthuma <hiltjo@codemadness.nl>
" URL:           http://www.codemadness.nl/
" Updated:       2010-12-11
"
" TODO:
" - replace color names with #rrggbb, see rgb.txt
" - make sure term, cterm and gui look (almost) the same.
" - fix diff colors.
" - test in term, cterm and gui.
"
" My .Xdefaults colours:
"
"     urxvt.background:        #333333
"     urxvt.foreground:        #bebebe
"
"     !black
"     urxvt*color0:            #333333
"     urxvt*color8:            #666666
"     !red
"     urxvt*color1:            #cd5c5c
"     urxvt*color9:            #ffa0a0
"     !green
"     urxvt*color2:            #b7ce42
"     urxvt*color10:           #bde077
"     !yellow
"     urxvt*color3:            #bdb76b
"     urxvt*color11:           #ffe863
"     !blue
"     urxvt*color4:            #47a2c7
"     urxvt*color12:           #87ceeb
"     !magenta
"     urxvt*color5:            #a17ba1
"     urxvt*color13:           #d793d7
"     !cyan
"     urxvt*color6:            #5e9ca7
"     urxvt*color14:           #8ce1f0
"     !white
"     urxvt*color7:            #eeeeee
"     urxvt*color15:           #ffffff
"
" NOTE: "grey" is "#a8a8a8" for me, not sure why.
"
" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
	" no guarantees for version 5.8 and below, but this makes it stop
	" complaining
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
let g:colors_name="relaxed"

"Normal text.
hi Normal       cterm=none ctermfg=none
hi Normal       gui=none   guifg=#bebebe guibg=#333333

"Highlight vim groups properly (this is broken atm for me on linux).
"hi VimGroup     guifg=#eeeeee
hi VimGroup     ctermfg=grey

"Non-text.
hi NonText      cterm=none ctermfg=grey
hi NonText      gui=none   guifg=#a8a8a8 guibg=#333333

"Cursor.
hi Cursor       cterm=none
hi Cursor       gui=none
hi CursorLine   cterm=none ctermbg=darkgrey
hi CursorLine   gui=none guibg=#666666
hi CursorColumn cterm=none ctermbg=darkgrey
hi CursorColumn gui=none guibg=#666666

"Diff
"TODO/NOTE: this isnt used, DiffAdd = Identifier, DiffDelete = Special
"hi DiffAdd      gui=none guifg=#8ef08c guibg=#333333 ctermfg=darkgreen
"hi DiffChange   gui=none guifg=#ffe863 guibg=#333333 ctermfg=darkgreen
"hi DiffDelete   gui=none guifg=#ffa0a0 guibg=#333333 ctermfg=darkred
"hi DiffText     gui=none guifg=#eeeeee guibg=#494949 ctermfg=grey

"Vertical split.
"hi VertSplit    cterm=reverse
hi VertSplit cterm=none ctermfg=grey ctermbg=grey
hi VertSplit    gui=none guifg=#a8a8a8 guibg=#a8a8a8

"Folded text.
hi Folded       ctermfg=white ctermbg=darkgrey 
hi Folded       guifg=#ffffff guibg=#666666

"Folded columns (treeview-like stuff).
hi FoldColumn   ctermfg=darkgrey ctermbg=none
hi FoldColumn   guifg=#666666    guibg=#333333

"Search, matched text.
hi Search       cterm=none ctermfg=black ctermbg=yellow
hi Search       guifg=#333333 guibg=#ffe863

"Incremental Search.
hi IncSearch    cterm=none ctermfg=black ctermbg=yellow
hi IncSearch    gui=none   guifg=#333333 guibg=#ffe863

"Mode messages.
hi ModeMsg      ctermfg=yellow
hi ModeMsg      guifg=#ffe863

"'More' messages.
hi MoreMsg      ctermfg=magenta
hi MoreMsg      guifg=#d793d7

hi Question     ctermfg=green
hi Question     guifg=#bde077

hi SpecialKey   ctermfg=green
hi SpecialKey   guifg=#bde077

hi StatusLine   cterm=none ctermfg=black ctermbg=lightgrey
hi StatusLine   gui=none   guifg=black guibg=lightgrey

"hi StatusLineNC cterm=reverse
hi StatusLineNC cterm=none ctermfg=white ctermbg=darkgrey
hi StatusLineNC gui=none   guifg=white  guibg=#666666

hi Title        ctermfg=red
hi Title        guifg=#ffa0a0

"Selected text.
hi Visual       gui=none guibg=#666666
if $TERM == "linux"
	hi Visual   term=reverse
else
	hi Visual   cterm=none ctermbg=darkgrey
endif

"Warning messages.
hi WarningMsg   ctermfg=darkred
hi WarningMsg   guifg=#cd5c5c

"Comments.
hi Comment      ctermfg=blue
hi Comment      guifg=#87ceeb

"Strings, values and constants.
hi Constant     ctermfg=red
hi Constant     guifg=#ffa0a0

"Variables and function names.
hi Identifier   ctermfg=green
hi Identifier   guifg=#bde077

"Statements.
hi Statement    ctermfg=yellow
hi Statement    gui=none guifg=#ffe863

"Preprocessor, includes, #define, etc.
hi PreProc      ctermfg=darkred
hi PreProc      guifg=#cd5c5c

"int, long, char, etc.
hi Type         gui=none      guifg=#b7ce42
hi Type         cterm=none    ctermfg=darkgreen

"Braces and shit.
hi Special      ctermfg=red
hi Special      guifg=#ffa0a0

"TODO.
hi Todo         ctermfg=black ctermbg=white
hi Todo         guifg=#333333 guibg=white   

"Error messages.
hi Error        cterm=none    ctermfg=white ctermbg=darkred
hi Error        gui=none      guifg=#ffffff guibg=#cd5c5c   
hi ErrorMsg     cterm=bold    ctermfg=white ctermbg=darkred
hi ErrorMsg     gui=bold      guifg=#ffffff guibg=#cd5c5c

"Line numbers / bar.
hi LineNr       cterm=none    ctermfg=darkgrey ctermbg=black
hi LineNr       gui=none      guifg=#666666    guibg=#333333

"Pop-up and other menus.
hi WildMenu     cterm=none    ctermfg=white     ctermbg=darkgrey  
hi WildMenu     gui=none      guifg=#ffffff     guibg=#666666
hi Pmenu        cterm=none    ctermfg=lightgrey ctermbg=darkgrey
hi Pmenu        gui=none      guifg=#ffffff     guibg=#666666
hi PmenuSel     cterm=none    ctermfg=white     ctermbg=grey
hi PmenuSel                   guifg=#ffffff     guibg=#a8a8a8

hi Underlined   cterm=underline
hi Underlined   gui=underline

hi Ignore       cterm=none ctermfg=darkgrey
hi Ignore       gui=none   guifg=#666666

hi Directory    ctermfg=cyan
hi Directory    guifg=#8ce1f0

"Matching brackets (highlight).
hi MatchParen   cterm=none ctermfg=black ctermbg=grey
hi MatchParen   gui=none   guifg=#333333 guibg=#a8a8a8
