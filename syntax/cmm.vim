" Syntax highlighting for cmm
set ft=c
syn match Comment /#.*/
syn match Include /^[<>].*/
syn keyword cType byte ptr
