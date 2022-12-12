" F5 will execute the shell file
function! RunSh()
    w
    execute 'AsyncRun /bin/sh %'
endfunction
nnoremap <F5> :call RunSh() <CR>
