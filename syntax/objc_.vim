" this must not be named objc.vim
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

runtime! syntax/objc.vim

syn keyword objcTypeModifier __block
syn match  objcDirective    "@([^)]\+)"
