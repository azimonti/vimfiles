set nocompatible               " be iMproved
filetype off                   " required!

" if needed set the size of the screen
" set lines=24 columns=150
" temporary workaround
if has('python3')
  silent! python3 1
endif

set rtp=$MYVIMFILES,$VIM,$VIMRUNTIME
"let g:plug_threads = 1
call plug#begin($HOME . '/.vim/plugged')
    " Automatically run autocomplete. No need for ctrl-n/p
    Plug 'eparreno/vim-l9'
    Plug 'othree/vim-autocomplpop'
    " For Git
    Plug 'tpope/vim-fugitive'
    " File browser
    Plug 'scrooloose/nerdtree'
    " For NERDTree and Git
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " For NERDTree and local ignore
    Plug 'dsimidzija/vim-nerdtree-ignore'
    " Add commands like Remove, Move, Find
    Plug 'tpope/vim-eunuch'
    " Git gutter, with stage and revert in <leader>hs / hr
    Plug 'airblade/vim-gitgutter'
    " Controp
    Plug 'ctrlpvim/ctrlp.vim'
    " List modified files in a git repo
    Plug 'jasoncodes/ctrlp-modified.vim'
    " Improved status line
    Plug 'bling/vim-airline'
    " Rectify folding indent
    Plug 'tmhedberg/SimpylFold'
    " Python indent plugin
    Plug 'Vimjas/vim-python-pep8-indent'
    " Disable arrow keys
    Plug 'wikitopian/hardmode'
    " highlight trail spaces in red
    Plug 'ntpeters/vim-better-whitespace'
    " ejs syntax
    Plug 'nikvdp/ejs-syntax'
    " html autocomplete
    Plug 'vim-scripts/closetag.vim', { 'for': ['.ejs', '.html'] }
    Plug 'tmhedberg/matchit', { 'for': ['.ejs', '.html'] }
    " ipython
    " Plug 'wmvanvliet/vim-ipython'
    " solidity syntax
    Plug 'tomlion/vim-solidity'
    " LaTeX syntax
    Plug 'lervag/vimtex'
    " Haskells syntax
    Plug 'neovimhaskell/haskell-vim'
call plug#end()

" colorscheme
set t_Co=256
"color candycode
color molokai
" connect the system clipboard
set clipboard^=unnamed,unnamedplus

" minimal gui
set guioptions=i
set guioptions+=r

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

set wildignore+=*.pyc,*.DS_Store,build,node_modules,__pycache__,*.xml,*.csv
" Nerdtree config for wildignore
"let NERDTreeRespectWildIgnore=1
let NERDTreeIgnore=[ '*.pyc$', '*.DS_Store$', 'build$[[dir]]', 'node_modules$[[dir]]', '__pycache__$[[dir]]', 'xml$[[dir]]']

" Open NERDTree at startup
"autocmd vimenter * NERDTree
" Map key for NERDTree
map <C-n> :NERDTreeToggle<CR>
" shortcut to quickly find a file in NERDTree
nmap <leader>p :NERDTreeFind<CR>
" Open NERDTree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if NERDTree is the only open tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" CtrlP tags lookup
nnoremap <leader>s :CtrlPTag<CR>
" <leader>[w]f to find input for GitGrep
nnoremap <leader>wf :GitGrep -w <cword><Space>
nnoremap <leader>f :GitGrep<Space>
" <leader>g to find a tag (C-] is taken over by clang_complete)
nnoremap <leader>g :exec("tag ".expand("<cword>"))<CR>
" <leader>cd to change the dir to the current file
nnoremap <leader>cd :cd %:p:h<CR>

" ctrlp-modified shortcuts (NOTE: not working in Windows ?)
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>

" == Settings for CtrlP Finder
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$|bin$|obj|data$|Debug$|Release$|RelWithDebInfo$',
  \ 'file': '\v\.(exe|so|dll|o|d|jar|class)$',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" Enable vim hardmode
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = "Don't use this!"
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
autocmd VimEnter,BufNewFile,BufReadPost * silent! call EasyMode()

nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" automatically refresh changed files
set autoread

" enable white space coloring
let g:better_whitespace_enabled=1
" remap for cleaning whitespaces
let g:better_whitespace_operator='_s'

syntax on
filetype plugin indent on

" Python indent
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set fileformat=unix

" js, html, css indent
au BufNewFile,BufRead *.js,*.ejs,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set expandtab |
    \ set shiftwidth=2 |
    \ set fileformat=unix

au BufEnter *.ejs :setl filetype=html

" f5 will launch python3
nnoremap <silent> <F5> :!python3 %<CR>

" Disable annoying beeping
set noerrorbells
set vb t_vb=
autocmd GUIEnter * set vb t_vb=

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ejs', 202, 'none', '#ff5f00', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
