" F5 will compile the imagemagick file
function! RunImagemagick()
    w
    execute 'AsyncRun /usr/local/bin/magick-script %'
endfunction

nnoremap <F5> :call RunImagemagick()<CR>
