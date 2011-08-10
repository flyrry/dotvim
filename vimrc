set shell=/bin/bash                          " set default shell to bash as some plugins don't work in other shells

set nocompatible                             " say bye bye to vi

set title                                    " change terminal's title

filetype off                                 " force reloading *after* pathogen loaded

call pathogen#runtime_append_all_bundles()   " pathogen magic
call pathogen#helptags()

syntax on                                    " syntax highlighting

filetype plugin indent on                    " enable detection, plugins and indenting in one step

set number                                   " show line numbers
"set relativenumber                          " show distance from current line to other lines

set showmode                                 " always show what mode we are currently editing in

set nowrap                                   " do not wrap lines

set scrolloff=4                              " keep 4 lines off the edges of the screen when scrolling

set hlsearch                                 " highlight search terms
set incsearch                                " show search matches as you type
set ignorecase                               " ignore case when searching
set smartcase                                " ignore case if search pattern is lowercase, case sensitive otherwise

set autoindent                               " always set autoindenting on

set shiftwidth=2                             " number of spaces to use for autoindenting
set tabstop=2                                " a tab is two spaces
set softtabstop=2                            " when backspace is used, pretend like a tab is removed, even if spaces
set expandtab                                " expand tabs by default (overloadable per file type later if needed)


set laststatus=2                             " always show status line

set statusline=%<%f\                         " filename
set statusline+=%w%h%m%r                     " options
set statusline+=%{fugitive#statusline()}     " Git Hotness
set statusline+=\ [%{&ff}/%Y]                " filetype
set statusline+=\ [%{getcwd()}]              " current directory
"set statusline+=\ [A=\%03.3b/H=\%02.2B]     " ASCII / Hexadecimal value of char
set statusline+=%=%-14.(%l,%c%V%)\ %p%%      " Right aligned file navigation info

set encoding=utf-8                           " self explanatory, right?

set hidden                                   " hide buffers instead of closing them

set history=1000                             " more brainz
set undolevels=1000                          " even more brainz

set nobackup                                 " no more backup files
set noswapfile                               " let's hope we won't regret it one day

if v:version >= 730
  set undofile                               " undo available even after reopening the file
  set undodir=~/.vim/.undo,~/tmp,/tmp        " we don't care about free space on our hdd, do we?
endif

set noerrorbells                             " seriously, stop beeping

au BufRead,BufNewFile *.target set filetype=jproperties
