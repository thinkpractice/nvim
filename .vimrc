" Set defaults
set nu
set encoding=utf-8
syntax on

let $PYTHONHOME='/packages/python-2.7.13-3/.self/'
let $PYTHONPATH='/packages/python-2.7.13-3/.self/lib/'

call plug#begin('~/.vim/plugged')
    " Code snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " Ctrl-P - Fuzzy file search
    Plug 'kien/ctrlp.vim'
    " Status bar mods
    Plug 'bling/vim-airline'
    Plug 'airblade/vim-gitgutter'
    " Tab completion
    Plug 'ervandew/supertab'
    " Code Folding
    Plug 'tmhedberg/SimpylFold'
    " Color Schemes
    Plug 'tomasr/molokai'
    Plug 'dracula/vim'
    Plug 'jnurmine/Zenburn'
    " File Browsing
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Git Integration
    Plug 'tpope/vim-fugitive'
    " Vim-airline Themes
    Plug 'vim-airline/vim-airline-themes'
    " Tagbar
    Plug 'majutsushi/tagbar'
    " Auto-close bracket...
    Plug 'Raimondi/delimitMate'
"" Initialize plugin system
call plug#end()

" UltiSnips config
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""" SuperTab configuration """""""
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction

let g:SuperTabClosePreviewOnPopupClose = 1
""""""" General coding stuff """""""
set list
set listchars=tab:>-,trail:-,extends:#,nbsp:-
set modeline
"set tw=78
set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Always show status bar
set laststatus=2
" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Disable mouse click to go to position
set mouse-=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert

" enable folding
set foldmethod=indent
set foldlevel=99

" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000
let g:airline_powerline_fonts = 1

"""""""Python settings """""""
syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1
" hide .pyc when browsing files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"""" color schemes """"""
colorscheme molokai

""""""" keybindings """""""
" set up leaders
let mapleader=","
let maplocalleader="\\"

"split navigations
" ctrl-j move to the split below
" ctrl-k move to the split above
" ctrl-l move to the split to the right
" ctrl-h move to the split to the left
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

"specific key or shortcut to open nerdtree
map <c-n> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" enable folding with the spacebar
nnoremap <space> za

" open nerdtree automatically when nvim starts up on opening a directory
autocmd stdinreadpre * let s:std_in=1
autocmd vimenter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'nerdtree' argv()[0] | wincmd p | ene | endif


