" plugin to handle the TaskVim to-do list format
" inspired by TaskPaper http://hogbaysoftware.com/projects/taskpaper
" 'stealed' some code and learned a lot from the great plugin TaskPaper for Vim by David O'Callaghan
" http://www.cs.tcd.ie/David.OCallaghan/taskpaper.vim/
" Language: TaskVim
" Maintainer: Jose Luis Diaz Gonzalez
" URL: http://joseluisdgz.com/projects/taskvim/
" Version: 0.3
" Last Change: 10/02/2012

" check if the plugin is already loaded
if exists("b:loaded_todo")
    finish
endif
let b:loaded_todo = 1

let s:save_cpo = &cpo
set cpo&vim

" Autocreate list items
setlocal comments+=b:—,
setlocal formatoptions=qro1
"add '@' to keyword character set so that we can complete contexts as keywords
setlocal iskeyword+=@-@
" Set up list formating 
" almost perfect config for list handling
setlocal autoindent
setlocal textwidth=0
setlocal wrapmargin=0
setlocal nolist

"fold projects
setlocal foldmethod=syntax

nnoremap <buffer> <F1> :help todo-quickstart<cr>zt
inoremap <buffer> <F1> <c-o>:help todo-quickstart<cr>zt

let &cpo = s:save_cpo
unlet s:save_cpo
