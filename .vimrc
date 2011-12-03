" .vimrc
set nocompatible

" enable mouse
set mouse=a
set ttymouse=xterm2

" appearance
syntax on
filetype on
filetype indent on
filetype plugin on
set scrolloff=4 " keep 4 lines around cursor
set number
set ruler
set cursorline
set showmatch
set mat=5
set textwidth=80

set background=dark
if &term != 'linux'
  colorscheme solarized
endif

" command/status bar
set showcmd
set cmdheight=2
set laststatus=2

" don't use vim backups
set nobackup
set nowritebackup

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" tabs
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set smarttab
filetype plugin indent on

" editing
set backspace=indent,eol,start " backspace clears indents and newlines
set nowrap
set listchars=tab:▸\ ,trail:·,eol:¬
