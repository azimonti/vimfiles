" F5 will compile the matlab file with octave
function! RunOctave()
    w
    execute 'AsyncRun /usr/local/bin/octave %'
endfunction
nnoremap <F5> :call RunOctave() <CR>
