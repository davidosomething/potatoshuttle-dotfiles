" .vimrc
set nocompatible
set encoding=utf-8
" don't use vim backups
set nobackup
set nowritebackup
" enable mouse
set mouse=a
set ttymouse=xterm2

" fix for running in tmux/screen with xterm-keys on
if &term == "screen" || &term == "screen-256color"
  set t_kN=^[[6;*~
  set t_kP=^[[5;*~
endif

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
"set textwidth=80
set background=dark
if &term != 'linux'
  colorscheme solarized
endif
" command/status bar
set showcmd
set cmdheight=2
set laststatus=2

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" tabs
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
" extra indents based on syntax, interferes with file indents
"set smartindent
" copy indent chars (eg comments or bullets)
set autoindent

" editing
set backspace=indent,eol,start " backspace clears indents and newlines
set nowrap
" set listchars=tab:▸\ ,trail:·
" set list listchars=tab:\ \ ,trail:·
set list listchars=tab:▸\ ,trail:·

