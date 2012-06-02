filetype on
set colorcolumn=

if has("autocmd")
	filetype indent on
	filetype plugin on


	function! TrimSpaces()
		normal mZ
		%s/\s\+$//e
		if line("'Z") != line(".")
			echo "Stripped whitespace\n"
		endif
		normal 'Z
	endfunction

	autocmd BufRead,BufNewFile *.s,asm,nasm set ft=nasm
	"autocmd BufRead,BufNewFile *.txt        set spell
	autocmd FileType c,cpp,slang            set cindent

	autocmd FileType c,cpp                  so ~/.vim/omni.vim

	autocmd BufRead,BufNewFile *.txt        set wrap

	autocmd BufWritePre *                   call TrimSpaces()
	" binding to turn off ^
	nmap <leader>W :autocmd! BufWritePre<CR>

	" when we reload, tell vim to restore the cursor to the saved position
	augroup JumpCursorOnEdit
	 au!
		autocmd BufReadPost *
			\ if expand("<afile>:p:h") !=? $TEMP |
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\ let JumpCursorOnEdit_foo = line("'\"") |
			\ let b:doopenfold = 1 |
			\ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
			\ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
			\ let b:doopenfold = 2 |
			\ endif |
			\ exe JumpCursorOnEdit_foo |
			\ endif |
			\ endif
			" Need to postpone using "zv" until after reading the modelines.
		autocmd BufWinEnter *
			\ if exists("b:doopenfold") |
			\ exe "normal zv" |
			\ if(b:doopenfold > 1) |
			\ exe "+".1 |
			\ endif |
			\ unlet b:doopenfold |
			\ endif
	augroup END
endif

function! Wm()
	" :wq
	" :mak
	w
	mak
endfunction

syntax on " syntax highlighting
set nohlsearch
set nocompatible " prevents vim emulating vi's bugs/limits
set guioptions=gtcf
"set nonu " line numbering
set nowrap " don't wrap lines
set sbr=^
set showmatch
set bs=indent,eol " allow backspacing over everything in insert mode
set incsearch
set showmatch " bracket matching
set matchpairs+=<:> " have % bounce between angled brackets, as well as t'other kinds:
set smartcase  " if search term has caps in, don't ignore case
set backspace=indent,eol,start " make backspace a more flexible
set noexpandtab
"set virtualedit=all " allow the cursor to roam anywhere
"set nomodeline
set laststatus=2
set showcmd
set scrolloff=5 " buffer zone at top and bottom
set cmdheight=1
set ttyfast
set wildmode=list:longest
set completeopt=menu,longest
set shortmess=filmnrwxtToO
set nofoldenable
set cryptmethod=blowfish
set sidescroll=1
set nowrapscan
set linebreak " visual wrapping
set breakat=\ \	!@*-+;:,./?
set ve=all

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=0x%02.2B]\ [POS=%04l/%L,%04v,%p%%]\
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04v,%04l,%p%%]\ [LEN=%L]
set statusline=\ \%f%m%r%h%w\ ::\ %y[%{&ff}]\%=\ [%02v\ %p%%\ %l/%L]

"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

" set chars to show
set encoding=utf-8
"set listchars=tab:>-,trail:%
set listchars=tab:»·,trail:·,precedes:<,extends:>
"set listchars=trail:·,tab:..
"set listchars=trail:·,tab:
set nolist
" FIXME:
" display /^\t* \+[^ \t]/



" Tell vim to remember certain things when we exit
"  '20 : marks will be remembered for up to X previously edited files
"  "100 : will save up to X lines for each register
"  :200 : up to X lines of command-line history will be remembered
"  n... : where to save the viminfo files
set viminfo='20,\"100,/50,:200,n~/.viminfo

set history=200

set smarttab
set sw=2 " shiftwidth - >> and << adjustment
set tabstop=2
set sr " shifts are a multiple of sw
set nobackup
set ignorecase " searching
set clipboard= " no x11 change on visual

set foldlevel=256 " annoying

"set copyindent " buh
"set autoindent " indents to same as last line
set smartindent " uses c syntax etc to see where to indent to

let   c_space_errors = 1
let   c_no_curly_error = 1
let   c_gnu = 1

let gui_in_tui = 0
" Display - status line, etc
if (gui_in_tui > 0 && &term =~ "-256color")
	set t_Co=256
	colorscheme molokai
else
	let CSApprox_loaded = 1
	colorscheme neutral
endif
" View colours:
" :runtime syntax/colortest.vim


" backslash + [tcl etc]
imap <leader>c <Esc>mpa/*<End>*/<Esc>`pl
"nmap <leader>t :Tlist<CR>
nmap <leader>t :set ts=8 sw=8<CR>
nmap <leader>x :r!xsel -o<CR>
nmap <leader>s s<Space><Esc>pa<Space><Esc>l

nmap <leader>m :call Wm()<CR>
nmap <leader>n :cn<CR>

nmap <leader>l :set list!<CR>
nmap <leader>h :set hls!<CR>
nmap <leader>w :set wrap!<CR>
nmap <leader>N :set nu!<CR>
nmap <leader>a :vert ball<CR>

" man page auto ret
nmap K K<cr>

map <leader>T :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>


" custom highlighting
"highlight MyTagListTagName   guifg=blue ctermfg=blue
"highlight MyTagListTagName   guifg=blue ctermfg=blue
"highlight MyTagListTagScope  guifg=blue ctermfg=blue
"highlight MyTagListTitle     guifg=blue ctermfg=blue
"highlight MyTagListComment   guifg=blue ctermfg=blue
"highlight MyTagListFileName  guifg=blue ctermfg=blue

" move up/down without changing cursor pos
nnoremap <C-Y>    3<C-Y>
nnoremap <C-E>    3<C-E>
" C-X C-[YE] for insert mode

" Side scrolling
nnoremap zh 8zh
nnoremap zh 8zl

nnoremap ' `
nnoremap ` '

nnoremap ZW :w<CR>
nnoremap ZE :e<CR>

"vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" time to cock it all up with dvorak
":e $VIMRUNTIME/macros/dvorak
"set langmap='q,\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

let s:extra = globpath(&rtp, '/vimrc.local')
if filereadable(s:extra)
	exec 'source ' . s:extra
endif
