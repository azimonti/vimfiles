" F5 will launch python3
function! RunPython()
    w
    execute 'AsyncRun python3 %'
endfunction
nnoremap <F5> :call RunPython()<CR>
" F7 will launch autopep8
autocmd FileType python noremap <buffer> <F7> :call Autopep8()<CR>
let g:autopep8_aggressive=2
" F8 will launch flake8
autocmd FileType python map <buffer> <F8> :call flake8#Flake8()<CR>
