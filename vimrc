set shell=/bin/bash

set nocompatible
set title

filetype off

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on

filetype plugin indent on

set incsearch
set ignorecase
set smartcase

set number

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set autoindent

set laststatus=2
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%{fugitive#statusline()} "  Git Hotness
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set encoding=utf-8
