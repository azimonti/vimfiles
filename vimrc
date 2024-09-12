set nocompatible               " be iMproved
filetype off                   " required!

" if needed set the size of the screen
" set lines=24 columns=150
" temporary workaround
if has('python3')
  silent! python3 1
endif

set rtp=$MYVIMFILES,$VIM,$VIMRUNTIME

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"let g:plug_threads = 1
call plug#begin($HOME . '/.vim/plugged')
    " Automatically run autocomplete. No need for ctrl-n/p
    Plug 'eparreno/vim-l9'
    Plug 'othree/vim-autocomplpop'
    " unload, delete or wipe a buffer without closing the window or split
    Plug 'qpkorr/vim-bufkill'
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
    if !(has('win32') || has('win64') || has('win32unix'))
        " Use the sign column to indicate added, modified and removed lines
        Plug 'mhinz/vim-signify'
        " Copilot"
        " Plug 'github/copilot.vim'
        " " Disable Copilot by default
        " let g:copilot_filetypes = {
        "             \ '*': v:false,
        "             \ 'cpp': v:true,
        "             \ 'cmake': v:true,
        "             \ 'fortran': v:true,
        "             \ 'matlab': v:true,
        "             \ 'python': v:true,
        "             \ }
        " function ToggleCopilot()
        "     if exists('b:copilot_enabled')
        "         if(b:copilot_enabled)
        "             let b:copilot_enabled=v:false
        "         else
        "             let b:copilot_enabled=v:true
        "         endif
        "     else
        "         let b:copilot_enabled=v:true
        "     endif
        " endfunction
        " " map to toggle Copilot on / off
        " nnoremap <silent> <F3> :call ToggleCopilot()<CR>
    endif
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
    Plug 'takac/vim-hardtime'
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
    " Autopep8
    Plug 'tell-k/vim-autopep8'
    " Flake8
    Plug 'nvie/vim-flake8'
    " AsyncRun
    Plug 'skywind3000/asyncrun.vim'
    " Switch src/header
    Plug 'derekwyatt/vim-fswitch'
    " Tagbar
    Plug 'majutsushi/tagbar'
    " GitGrep for fast grepping
    Plug 'tjennings/git-grep-vim'
    " Quick list and location list toggler
    Plug 'Valloric/ListToggle'
    " allow local configuration file by project
    Plug 'embear/vim-localvimrc'
call plug#end()

" colorscheme
set t_Co=256
if has("win32unix")
  color candycode
else
  color molokai
endif

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
set nowritebackup
set scrolloff=1 " keep 1 line below and above the cursor
set laststatus=2 " always show the status line

set nrformats-=octal " remove octal from the nrformats list

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enable to replace in visual mode using h register
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" make search case insensitive
set ignorecase
set smartcase

" simplified splits nagivation
" Using C-hjkl to move around
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" cycle open buffers
" :nnoremap <Tab> :bnext<CR>
" :nnoremap <S-Tab> :bprevious<CR>
" list open buffers
:nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
:nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>
:nnoremap ˜ :bnext<CR>:redraw<CR>:ls<CR>
:nnoremap π :bprevious<CR>:redraw<CR>:ls<CR>

" select next/prev using C-j/k instead of C-n/p
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

map <silent> <A-j> :cnext<CR>
map <silent> <A-k> :cprevious<CR>
map <silent> <A-c> :cclose<CR>
map <silent> ∆ :cnext<CR>
map <silent> ˚ :cprevious<CR>
map <silent> ç :cclose<CR>

" localvimrc configuration
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
let s:localvimrc_whitelist = '.*'

set wildignore+=*.pyc,*.DS_Store,build,node_modules,__pycache__,*.xml,*.csv
" Nerdtree config for wildignore
"let NERDTreeRespectWildIgnore=1
let NERDTreeIgnore=[ '*.pyc$', '*.DS_Store$', 'bin$[[dir]]', 'build$[[dir]]', 'ctags.d$[[dir]]', 'node_modules$[[dir]]', '__pycache__$[[dir]]', '_var$[[dir]]', 'xml$[[dir]]']

" open NERDTree at startup
"autocmd vimenter * NERDTree
" map key for NERDTree
map <C-n> :NERDTreeToggle<CR>
" shortcut to quickly find a file in NERDTree
nmap <leader>p :NERDTreeFind<CR>
" open NERDTree if no files are specified
"" autocmd StdinReadPre * let s:std_in=1
"" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if NERDTree is the only open tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree automatically when vim starts up on opening a directory
"" autocmd StdinReadPre * let s:std_in=1
"" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" CtrlP tags lookup
nnoremap <leader>s :CtrlPTag<CR>
" <leader>[w]f to find input for GitGrep
nnoremap <leader>wf :GitGrep -w <cword><Space>
nnoremap <leader>f :GitGrep<Space>
" <leader>g to find a tag (C-] is taken over by clang_complete)
nnoremap <leader>g :exec("tag ".expand("<cword>"))<CR>
" <leader>cd to change the dir to the current file
nnoremap <leader>cd :cd %:p:h<CR>

" CtrpP shortcuts
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>
map <F4> :CtrlPClearCache<CR>
" CtrlP finder
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$|bin$|build$|Debug$|data$|obj|Release$',
  \ 'file': '\v\.(exe|so|dll|o|d|jar|class)$',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" F6  will remove all trailing whitespaces
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" fswitch
nmap <silent> <Leader>o :FSHere<CR>

" vim-fugitive
command GPush Git pull | Git push
cnoreabbrev gp GPush
cnoreabbrev <silent> gs Git

" vim hardmode settings
let g:hardtime_showmsg = 1
let g:hardtime_timeout = 100000000
let g:list_of_normal_keys = []
let g:list_of_visual_keys = []
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
map <Leader>ht :HardTimeToggle<CR>

" set ft-vim-plugin option
let g:tex_flavor = 'latex'

" enable folding
set foldmethod=indent
set foldlevel=99

" enable folding with the spacebar
nnoremap <space> za

" automatically refresh changed files
set autoread

" enable white space coloring
let g:better_whitespace_enabled=1
" remap for cleaning whitespaces
let g:better_whitespace_operator='_s'

syntax on
filetype plugin indent on

" abbreviations
" ↔ left right arrow
"" iabbrev <-> <C-V>u2194
" ← left arrow
"" iabbrev <-- <C-V>u2190
" → right arrow
"" iabbrev --> <C-V>u2192

" set default indent removing tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" default indent for most extensions
au BufNewFile,BufRead *.c,*.cpp,*.cc,*.ccx,*.f,*.f90,*.f95,*.gpi,*.h,*.hpp,*.hh,*.hxx,*.imk,*.py,*.sh,*.vim
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set fileformat=unix

" CMakeLists.txt indent
au BufNewFile,BufRead CMakeLists.txt
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set fileformat=unix

" dot indent
au BufNewFile,BufRead *.dot
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set autoindent |
    \ set smartindent |
    \ set fileformat=unix

" css, ejs, html, js, json, m, md, svg, xml indent
au BufNewFile,BufRead *.css,*.ejs,*.html,*.js,*,json,*.m,*.md,*.svg,*.xml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set expandtab |
    \ set shiftwidth=2 |
    \ set fileformat=unix

" load termdebug
packadd! termdebug
let g:termdebug_wide=1

function! NewUuid()
  if executable('uuidgen')
    return toupper(system("uuidgen | tr -d - | tr -d '\n' | tr '[:upper:]' '[:lower:]'  && echo"))
  else
    return "BINARY_NOT_FOUND"
  endif
endfunction

" Templates
:autocmd BufNewFile *.c,*.cpp,*.dot,*.f,*.f90,*.f95,*.gpi,*.h,*.hpp,*.imk,*.m,*.py,*.sh,*.svg exe "0r ~/.vim/templates/skeleton." .expand("%:e")
:autocmd BufNewFile *.c,*.cpp,*.dot,*.f,*.f90,*.f95,*.gpi,*.h,*.hpp,*.imk,*.m,*.py,*.sh,*.svg exe "1," . 8 . "g/FILENAME/s//" .expand("%:t:r")
:autocmd BufNewFile *.c,*.cpp,*.dot,*.f,*.f90,*.f95,*.gpi,*.h,*.hpp,*.imk,*.m,*.py,*.svg      exe "1," . 8 . "g#DATE#s##" .strftime("%Y/%m/%d")
:autocmd BufNewFile *.sh                                                                      exe "1," . 12 . "g#DATE#s##" .strftime("%Y/%m/%d")
:autocmd BufNewFile *.h,*.hpp                                                                 exe "1," . 8 . "g/FILEGUARD/s//" .toupper(expand("%:t:r"))
:autocmd BufNewFile *.h,*.hpp                                                                 exe "1," . 8 . "g/UUID/s//" .toupper(NewUuid())


" disable annoying beeping
set noerrorbells
set vb t_vb=
autocmd GUIEnter * set vb t_vb=

" unsets the \"last search pattern\" register by hitting return
nnoremap <CR> :noh<CR><CR>

xnoremap p pgvy

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('.c', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('CMakeLists.txt', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('.coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('.cpp', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('.css', 'blue', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('.ejs', 'Red', 'none', 'Red', '#151515')
call NERDTreeHighlightFile('.f', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('.f90', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('.f95', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('.gpi', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('.h', 'cyan', 'none', 'green', '#151515')
call NERDTreeHighlightFile('.hpp', 'cyan', 'none', 'green', '#151515')
call NERDTreeHighlightFile('.html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('.imk', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('.ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('.jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('.js', 'Red', 'none', 'Red', '#151515')
call NERDTreeHighlightFile('.json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('makefile', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('.md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('.py', 'Magenta', 'none', 'Magenta', '#151515')
call NERDTreeHighlightFile('.styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('.txt', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('.yml', 'yellow', 'none', 'yellow', '#151515')
