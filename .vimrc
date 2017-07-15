set nocompatible
filetype on
syntax enable

call plug#begin()

Plug 'Lokaltog/vim-easymotion'
Plug 'Rip-Rip/clang_complete'
Plug 'Superbil/llvm.vim'
Plug 'arrufat/vala.vim'
Plug 'bling/vim-airline'
Plug 'bumaociyuan/vim-swift'
Plug 'cespare/vim-toml'
Plug 'digitaltoad/vim-jade'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'enthooz/vim-razor'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'guns/vim-clojure-static'
Plug 'hylang/vim-hy'
Plug 'jdevera/vim-protobuf-syntax'
Plug 'juvenn/mustache.vim'
Plug 'kballard/vim-fish'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'neovimhaskell/haskell-vim'
Plug 'pangloss/vim-javascript'
Plug 'racer-rust/vim-racer'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'wlangstroth/vim-racket'

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
autocmd FileType go setlocal shiftwidth=4 tabstop=4

set cursorline
set wildmenu
set lazyredraw
set showmatch

if has('nvim') " Activate clipboard for neovim
  set clipboard+=unnamedplus
endif

au bufreadpre,bufnewfile *.cf set ft=lbnf
au bufreadpre,bufnewfile *.arc set ft=arc
au bufreadpre,bufnewfile *SConstruct set ft=scons

map ,h :bp<CR>
map ,l :bn<CR>

map ,t :TagbarToggle<CR>
map ,n :NERDTreeToggle<CR>

cmap w!! %!sudo tee > /dev/null %

filetype indent on

set backspace=indent,eol,start  " wtf?

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" line numbers
set nu

let g:gruvbox_italic=1

colorscheme gruvbox
set background=dark

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors

" last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" clang path on osx
let s:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
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

let g:indentLine_color_term = 001

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

nnoremap <leader>a: Ag

let g:SuperTabContextDefaultCompletionType = '<c-x><c-u>'

" hy
let g:hy_enable_conceal = 1

" react
let g:jsx_ext_required = 0

" racer
let $RUST_SRC_PATH = "~/Codes/rust/src/"
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1

let g:tlist_coffee_settings = 'coffee;f:function;v:variable'

" vimclojure
let g:vimclojure#ParenRainbow = 1

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
