" F5 will launch python3
function! RunPython()
    w
    silent! execute 'AsyncRun python3 %'
endfunction
nnoremap <F5> :call RunPython()<CR>
" F7 will launch autopep8
noremap <buffer> <F7> :call Autopep8()<CR>
" F8 will launch flake8
map <buffer> <F8> :call flake8#Flake8()<CR>
