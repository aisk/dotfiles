set nocompatible               " be iMproved
filetype on                    " 
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'jnwhiteh/vim-golang'
Bundle 'molokai'
Bundle 'Lokaltog/vim-powerline'
Bundle 'python.vim--Vasiliev'
Bundle 'clang-complete'
Bundle 'Tagbar'
Bundle 'ctrlp.vim'
Bundle 'VimClojure'
Bundle 'vim-coffee-script'
Bundle 'lemon.vim'
Bundle 'antlr3.vim'
Bundle 'lbnf.vim'
Bundle 'ack.vim'
Bundle 'wting/rust.vim'
Bundle 'arsenerei/vim-ragel'
Bundle 'scrooloose/syntastic'

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
au bufreadpre,bufnewfile *.cf set ft=lbnf

map ,t :TagbarToggle<CR>
map ,n :NERDTreeToggle<CR>

filetype plugin indent on

syntax on

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" line numbers
set nu

colorscheme molokai

if has('gui_running')
    set guifont=Monaco\ for\ Powerline:h12
endif

if &term =~? 'mlterm\|xterm\|screen-256'
    let &t_Co = 256
endif

" last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

let g:Powerline_symbols = 'fancy'

" better python highlight
let python_highlight_space_errors = 0
let python_highlight_all = 1


let g:syntastic_check_on_open = 0
let g:syntastic_python_flake8_args='--ignore=E501'
