
let mapleader=" "

set nocompatible
filetype plugin indent on
syntax enable

call plug#begin()

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --all' }

call plug#end()

set backspace=start,eol,indent

set nobackup
set nowb
set noswapfile

set hidden

" Search down into subfolders
" Provides tab-comletion for all file-related tasks
" !! for big project don't do that, and make it something a bit more
" specific
set path=.,**

" TODO "
" add include-search
" add tag-search (ctags)
set tags=tags;


set nowrap

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

set incsearch

set ignorecase

set hls

set matchpairs+=<:>

set wildmenu

set mouse=a

set encoding=utf8
set background=dark

set signcolumn=yes
highlight! link SignColumn LineNr

set cursorline
hi cursorline cterm=bold
hi cursorlineNr cterm=bold

set number relativenumber

set scrolloff=5

set laststatus=2
