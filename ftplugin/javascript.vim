" Check if JavaScript indentation has already been loaded
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" Set 'cindent' for C-like indentation
setlocal cindent

" Adjust 'cinoptions' to change indentation style
" The following settings adjust 'case' label and 'case' statement indentation
setlocal cinoptions+=:0,l1,t0,g0,(0
