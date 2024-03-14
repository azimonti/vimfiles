" F5 will execute the shell file
function! RunSh()
    w
    silent! execute 'AsyncRun /bin/sh %'
endfunction
nnoremap <F5> :call RunSh()<CR>
