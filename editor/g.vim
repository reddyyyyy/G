" Vim syntax file
" Language: g

" Usage Instructions
" Put this file in .vim/syntax/g.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.g set filetype=g

if exists("b:current_syntax")
  finish
endif

syntax keyword gTodos TODO XXX FIXME NOTE

" Language keywords
syntax keyword gKeywords if elif else end while do macro include

" Comments
syntax region gCommentLine start="//" end="$"   contains=gTodos

" Strings
syntax region gString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region gString start=/\v'/ skip=/\v\\./ end=/\v'/

" Set highlights
highlight default link gTodos Todo
highlight default link gKeywords Identifier
highlight default link gCommentLine Comment
highlight default link gString String

let b:current_syntax = "g"
