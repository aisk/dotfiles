set nocompatible               " be iMproved
filetype on                    " 
filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'Blackrush/vim-gocode'
Plug 'Lokaltog/vim-easymotion'
Plug 'Rip-Rip/clang_complete'
Plug 'Superbil/llvm.vim'
Plug 'Tagbar'
Plug 'VimClojure'
Plug 'Yggdroot/indentLine'
Plug 'a.vim'
Plug 'antlr3.vim'
Plug 'arc.vim'
Plug 'bling/vim-airline'
Plug 'briancollins/vim-jst'
Plug 'cespare/vim-toml'
Plug 'ctrlp.vim'
Plug 'dag/vim2hs'
Plug 'dart-lang/dart-vim-plugin'
Plug 'davidhalter/jedi-vim'
Plug 'digitaltoad/vim-jade'
Plug 'ekalinin/Dockerfile.vim'
Plug 'enthooz/vim-razor'
Plug 'ervandew/supertab'
Plug 'fishman/vim-vala'
Plug 'fugitive.vim'
Plug 'gilgigilgil/anderson.vim'
Plug 'godlygeek/tabular'
Plug 'guns/vim-clojure-static'
Plug 'hylang/vim-hy'
Plug 'jdevera/vim-protobuf-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'juvenn/mustache.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lbnf.vim'
Plug 'less.vim'
Plug 'mhinz/vim-startify'
Plug 'phildawes/racer'
Plug 'raichoo/purescript-vim'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'scons.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'sjl/vitality.vim'
Plug 'slim-template/vim-slim'
Plug 'terryma/vim-multiple-cursors'
Plug 'toyamarinyon/vim-swift'
Plug 'tpope/timl'
Plug 'trusktr/seti.vim'
Plug 'wlangstroth/vim-racket'
Plug 'zah/nimrod.vim'

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

colorscheme seti

if has('gui_running')
    set guifont=Monaco\ for\ Powerline:h12
    set guioptions-=L "隐藏左侧滚动条
    set guioptions+=r "显示右侧滚动条
endif

if &term =~? 'mlterm\|xterm\|screen-256\|nvim'
    let &t_Co = 256
endif

" last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" clang path on osx
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif
let g:clang_use_library = 1
let g:clang_complete_auto = 1
let g:clang_snippets = 1

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

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_flake8_args = "--ignore=E501"
let g:syntastic_mode_map = { 'passive_filetypes': ['html', 'java'] }
" let g:syntastic_javascript_checkers = []

" ctrlp
let g:ctrlp_extensions = ['tag']

" react
let g:jsx_ext_required = 0

" racer
let $RUST_SRC_PATH="/Users/asaka/Codes/rust/src/"

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
