set nocompatible               " be iMproved
filetype on                    " 
filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'a.vim'
Plug 'zah/nimrod.vim'
Plug 'scrooloose/nerdtree'
Plug 'Blackrush/vim-gocode'
Plug 'molokai'
Plug 'digitaltoad/vim-jade'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'ervandew/supertab'
Plug 'Rip-Rip/clang_complete'
Plug 'godlygeek/tabular'
Plug 'Lokaltog/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'Tagbar'
Plug 'ctrlp.vim'
Plug 'VimClojure'
Plug 'w0ng/vim-hybrid'
Plug 'kchmck/vim-coffee-script'
Plug 'jelera/vim-javascript-syntax'
Plug 'antlr3.vim'
Plug 'lbnf.vim'
Plug 'less.vim'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'dag/vim2hs'
Plug 'arsenerei/vim-ragel'
Plug 'fugitive.vim'
Plug 'scrooloose/syntastic'
Plug 'jdevera/vim-protobuf-syntax'
Plug 'terryma/vim-multiple-cursors'
Plug 'juvenn/mustache.vim'
Plug 'Yggdroot/indentLine'
Plug 'fishman/vim-vala'
Plug 'scons.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'sjl/vitality.vim'
Plug 'slim-template/vim-slim'
Plug 'toyamarinyon/vim-swift'
Plug 'arc.vim'
Plug 'wlangstroth/vim-racket'
Plug 'hylang/vim-hy'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'briancollins/vim-jst'
Plug 'Superbil/llvm.vim'

call plug#end()

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType slim setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

au bufreadpre,bufnewfile *.cf set ft=lbnf
au bufreadpre,bufnewfile *.arc set ft=arc
au bufreadpre,bufnewfile *SConstruct set ft=scons

map ,h :bp<CR>
map ,l :bn<CR>

map ,t :TagbarToggle<CR>
map ,n :NERDTreeToggle<CR>

cmap w!! %!sudo tee > /dev/null %

syntax on

filetype plugin indent on

set backspace=indent,eol,start  " wtf?

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" line numbers
set nu

" colorscheme Tomorrow-Night
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

if has('gui_running')
    set guifont=Monaco\ for\ Powerline:h12
    set guioptions-=L "隐藏左侧滚动条
    set guioptions+=r "显示右侧滚动条
endif

if &term =~? 'mlterm\|xterm\|screen-256'
    let &t_Co = 256
endif

" last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" clang path on osx
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" disable ominicomplete preview
set completeopt-=preview

let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

let g:EasyMotion_leader_key = '<Leader>'

let g:indentLine_color_term = 239

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:SuperTabContextDefaultCompletionType = '<c-x><c-u>'

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_flake8_args = "--ignore=E501"
let g:syntastic_mode_map = { 'passive_filetypes': ['html', 'java'] }

" ctrlp
let g:ctrlp_extensions = ['tag']
