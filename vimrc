set nocompatible               " be iMproved
filetype off                   " required!

" if needed set the size of the screen 
" set lines=24 columns=80

set rtp=$MYVIMFILES,$VIM,$VIMRUNTIME
"let g:plug_threads = 1
call plug#begin($HOME . '/.vim/plugged')
    " Automatically run autocomplete. No need for ctrl-n/p
    Plug 'eparreno/vim-l9' 
    Plug 'othree/vim-autocomplpop'
    " File browser
    Plug 'scrooloose/nerdtree'
    " For Git
    Plug 'tpope/vim-fugitive'
    " Add commands like Remove, Move, Find
    Plug 'tpope/vim-eunuch'
    " Git gutter, with stage and revert in <leader>hs / hr
    Plug 'airblade/vim-gitgutter'
    " Improved status line
    Plug 'bling/vim-airline'
    " Rectify folding indent
    Plug 'tmhedberg/SimpylFold'
    " Python indent plugin
    Plug 'Vimjas/vim-python-pep8-indent'
    " Disable arrow keys 
    Plug 'wikitopian/hardmode'
call plug#end()

set iminsert=0
set imsearch=0
set hid
set number
set hlsearch
set incsearch
set ffs=unix,dos
set nobackup
set noswapfile
set scrolloff=1 " keep 1 line below and above the cursor
set laststatus=2 " always show the status line

" simplified splits nagivation
" Using C-hjkl to move around
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" select next/prev using C-j/k instead of C-n/p
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

" Enable vim hardmode
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = "Don't use this!"
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" automatically refresh changed files
set autoread

" Python indent
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" js, html, css indent
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 

" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
