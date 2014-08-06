set nocompatible               " be iMproved
filetype on                    " 
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'Blackrush/vim-gocode'
Bundle 'molokai'
Bundle 'ervandew/supertab'
Bundle 'Rip-Rip/clang_complete'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'bling/vim-airline'
Bundle 'Tagbar'
Bundle 'ctrlp.vim'
Bundle 'VimClojure'
Bundle 'kchmck/vim-coffee-script'
Bundle 'antlr3.vim'
Bundle 'lbnf.vim'
Bundle 'less.vim'
Bundle 'rking/ag.vim'
Bundle 'wting/rust.vim'
Bundle 'arsenerei/vim-ragel'
Bundle 'fugitive.vim'
Bundle 'scrooloose/syntastic'
Bundle 'jdevera/vim-protobuf-syntax'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'juvenn/mustache.vim'
Bundle 'html5.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'fishman/vim-vala'
Bundle 'scons.vim'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'mikewest/vimroom'
Bundle 'sjl/vitality.vim'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-rails'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'zah/nimrod.vim'
Bundle 'toyamarinyon/vim-swift'
" Bundle 'gilligan/vim-lldb'
Bundle 'arc.vim'
Bundle 'wlangstroth/vim-racket'
Bundle 'hylang/vim-hy'
Bundle 'chriskempson/vim-tomorrow-theme'

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

filetype plugin indent on

syntax on

set backspace=indent,eol,start  " wtf?

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
    set guioptions-=L "隐藏左侧滚动条
    set guioptions+=r "显示右侧滚动条
endif

" if &term =~? 'mlterm\|xterm\|screen-256'
"     let &t_Co = 256
" endif
let &t_Co = 256

" last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" clang path on osx
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" clang path on cygwin
let s:clang_library_path='/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" disable ominicomplete preview
set completeopt-=preview

let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

let g:syntastic_check_on_open = 1
" let g:syntastic_python_flake8_args='--ignore=E501'
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

let g:EasyMotion_leader_key = '<Leader>'

let g:indentLine_color_term = 239

let g:Powerline_symbols = 'fancy'

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
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_flake8_args = "--ignore=E501"

" ctrlp
let g:ctrlp_extensions = ['tag']
