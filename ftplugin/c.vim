" F2 will launch clang-format
" h / cpp / hpp will read this plugin file as well
nnoremap <silent> <F2> :py3file /usr/local/opt/clang-format/share/clang/clang-format.py<CR>
map <C-I> :py3file /usr/local/opt/clang-format/share/clang/clang-format.py<CR>
imap <C-I> <c-o>:py3file /usr/local/opt/clang-format/share/clang/clang-format.py<CR>

" F7 will launch Termdebug
noremap <silent> <F7> :Termdebug<CR>
" Add mappings for :Step and :Over
noremap <silent> <F8> :Step<CR>
noremap <silent> <F9> :Over<CR>
