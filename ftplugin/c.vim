" F2 will launch clang-format
" h / cpp / hpp will read this plugin file as well
nnoremap <silent> <F2> :py3file /usr/local/opt/clang-format/share/clang/clang-format.py<CR>
map <C-I> :py3file /usr/local/opt/clang-format/share/clang/clang-format.py<CR>
imap <C-I> <c-o>:py3file /usr/local/opt/clang-format/share/clang/clang-format.py<CR>

" F8 will launch Termdebug
noremap <silent> <F8> :Termdebug<CR>
" Add mappings for :Step and :Over
noremap <silent> <F10> :Over<CR>
noremap <silent> <F11> :Step<CR>
