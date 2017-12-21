" Regex notes:
" match "abc.*$" where ".*" doesn't contain xyz: /abc\(\(xyz\)\@!.\)*$/

" functions
function! TrimSpaces()
	normal mZ
	%s/\s\+$//e
	if line("'Z") != line(".")
		echo "Stripped whitespace\n"
	endif
	normal 'Z
endfunction

function! Wm()
	up
	mak
endfunction


" plugins
execute pathogen#infect()
call pathogen#helptags()

" settings
filetype on
filetype indent on
filetype plugin on
syntax on

colorscheme grb256
highlight SpellBad ctermbg=red

set nocompatible
set cpoptions+=i
set tildeop
set nomore

set wildignore+=*.o,*.d
set wildmode=list:longest
set completeopt=menu,longest
set complete+=U " include non-bufferlist files
set complete-=i " don't follow includes

set guioptions=gcf
set showbreak=^

set backspace=indent,eol,start

set ignorecase
set nowrap
set linebreak
if exists("&breakindent")
	set breakindent
endif

" search
set nohlsearch incsearch smartcase nowrapscan

set showmatch matchpairs+=<:>

set noexpandtab smarttab shiftwidth=2 tabstop=2 shiftround

set virtualedit=all

set scrolloff=5
set sidescrolloff=3
set sidescroll=1

set laststatus=1
set showcmd
set ttyfast
set shortmess=aoOTIt

set showbreak=>\ "
set secure
set path+=/usr/include/x86_64-linux-gnu/,/usr/include/arm-linux-gnueabihf/

set statusline=\ \%f%m%r%h%w\ ::\ %y[%{&ff}]\%=\ [%02v\ %p%%\ %l/%L]

set encoding=utf-8
set listchars=tab:»·,trail:·,precedes:<,extends:>

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set viminfo='20,\"100,/50,:200,n~/.viminfo

set history=200

set nobackup
set clipboard= " no x11 change on visual

set visualbell t_vb=

" remove '=' from filename completion
set isfname-==

set formatoptions+=tcroql
if v:version >= 704
	set formatoptions+=j
endif

set cinoptions=l1,N-s,t0

set splitright splitbelow
set noequalalways

set diffopt+=vertical

"set foldlevelstart=0 " fdm=manual unless we have syntax
"set foldmethod=syntax

" lets
let c_space_errors = 1
let c_no_curly_error = 1
let c_gnu = 1

" file matches
autocmd FileType c,cpp,slang            set cindent
autocmd FileType text                   set wrap

autocmd FileType crontab setlocal nobackup nowritebackup

autocmd BufRead,BufNewFile *.txt   set ft=text
autocmd BufRead,BufNewFile *.s,*.asm set ft=gas

autocmd BufRead,BufNewFile *.ll    set ft=llvm

autocmd BufWritePre *              call TrimSpaces()
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


" maps
nmap <leader>x :r!xsel -o<CR>
nmap <leader>t :r!tmux showb<CR>
nmap <leader>s s<Space><Esc>pa<Space><Esc>l

nmap <leader>m :call Wm()<CR>
nmap <leader>n :cn<CR>
nmap <leader>N :up\|cn<CR>
nmap <leader>j :n<CR>
nmap <leader>J :up\|n<CR>

nmap <leader>l :set list!<CR>
nmap <leader>h :set hls!<CR>
nmap <leader>w :set wrap!<CR>
nmap <leader>S :set spell!<CR>
nmap <leader>a :vert ball<CR>
" preserve default yank register
vmap <leader>d "_dP

" man page auto return
nmap K K<cr>

" faster scrolling
nnoremap <C-Y>    3<C-Y>
nnoremap <C-E>    3<C-E>

" '' is easier than ``
nnoremap ' `
nnoremap ` '

" Z* extensions
nnoremap ZW :w<CR>
nnoremap ZE :e<CR>

" fold maps - prefer all-or-nothing
nnoremap zc zC | nnoremap zC zc
nnoremap zo zO | nnoremap zO zo
nnoremap zm zM | nnoremap zM zm
nnoremap zr zR | nnoremap zR zr

" make smartcase apply for * and #
nnoremap * /\<<C-R><C-W>\><CR>
nnoremap # ?\<<C-R><C-W>\><CR>

command -nargs=+ -range=% Filter let @p='' | execute '<line1>,<line2>g/<args>/y P' | new | setlocal bt=nofile | put! p | 1d
command -nargs=1 ClearReg execute 'call setreg(''<args>'', [])'
command -nargs=0 SetMailReply set ft=mail tw=0 spell so=0

" fix J to be an operator command
func! Joinoperator(submode)
	norm $mj
	'[,']join
	norm 'jl
endfunc
nnoremap J :silent set operatorfunc=Joinoperator<CR>g@
set nojoinspaces

" have [% and ]% as [[ and ]] equivalents of [{ and ]}
nnoremap <silent> [% :call searchpair('\[', '', '\]', 'Wb')<CR>
nnoremap <silent> ]% :call searchpair('\[', '', '\]', 'W')<CR>

"cnoremap <C-A> <Home> - ^A expands all matches
"cnoremap <C-F> <Right> - open cmdwindow
"cnoremap <C-B> <Left>

" matches
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" builtin global vars
let g:netrw_banner=0

" plugins
set runtimepath+=~/.vim/GIT/ctrlp.vim
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_max_depth = 8
nnoremap g<C-P> :CtrlPTag<CR>

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

let g:yankring_replace_n_nkey = '<C-J>'
let g:yankring_replace_n_pkey = '<C-K>'
let g:yankring_history_dir = '~/.vim/'
let g:yankring_max_element_length = 999999999
nmap <leader>p :YRShow<CR>

set grepprg=ag
cabbrev ag grep
let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore "_[^_]*" --ignore "*.o" --ignore "*.d" --ignore "node_modules" -g "" --depth 8'
nmap <leader>g :grep <C-R><C-W><CR>

let g:editqf_jump_to_error = 1
let g:editqf_no_mappings = 1
let g:editqf_no_type_mappings = 1
nmap <leader>c :QFAddNote<CR>

" local vimrc
let s:extra = globpath(&rtp, '/vimrc.local')
if filereadable(s:extra)
	exec 'source ' . s:extra
endif
