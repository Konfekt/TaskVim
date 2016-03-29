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
setlocal textwidth=0
setlocal wrapmargin=0
setlocal nolist

"fold projects
setlocal foldmethod=syntax

nnoremap <buffer> <F1> :<c-u>help todo-quickstart<cr>zt
inoremap <buffer> <F1> <c-o>:<c-u>help todo-quickstart<cr>zt

setlocal autoindent
setlocal indentexpr=TaskVimIndent()

function! TaskVimIndent()
  let l:prevnb_num = prevnonblank(v:lnum - 1)
  if l:prevnb_num == 0 | return 0 | endif

  let l:cur = getline(v:lnum)
  let l:prev = getline(v:lnum-1)
  let l:prevnb = getline(l:prevnb_num)

  if l:prevnb =~# '\v:$'
      return indent(l:prevnb_num) + shiftwidth()
  endif

  return indent(v:lnum-1)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
