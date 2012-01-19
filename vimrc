" set default shell to bash as some plugins don't work in other shells
set shell=/bin/bash

" say bye bye to vi
set nocompatible

" change terminal's title
set title

" force reloading *after* pathogen loaded
filetype off

" pathogen magic
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" syntax highlighting
syntax on

" enable detection, plugins and indenting in one step
filetype plugin indent on

" show line numbers
set number
" show distance from current line to other lines
" set relativenumber

" always show what mode we are currently editing in
set showmode

" do not wrap lines
"set nowrap

" keep 4 lines off the edges of the screen when scrolling
set scrolloff=4

" highlight search terms
set hlsearch
" show search matches as you type
set incsearch
" ignore case when searching
set ignorecase
" ignore case if search pattern is lowercase, case sensitive otherwise
set smartcase

" always set autoindenting on
set autoindent

" do smart autoindenting when starting a new line
set smartindent

" number of spaces to use for autoindenting
set shiftwidth=2
" a tab is two spaces
set tabstop=2
" when backspace is used, pretend like a tab is removed, even if spaces
set softtabstop=2
" expand tabs by default (overloadable per file type later if needed)
set expandtab


" always show status line
set laststatus=2

" filename
set statusline=%<%f\
" options
set statusline+=%w%h%m%r
" Git Hotness
set statusline+=%{fugitive#statusline()}
" RVM Hotness
set statusline+=%{rvm#statusline()}
" filetype
set statusline+=\ [%{&ff}/%Y]
" current directory
set statusline+=\ [%{getcwd()}]
" ASCII / Hexadecimal value of char
" set statusline+=\ [A=\%03.3b/H=\%02.2B]
" Right aligned file navigation info
set statusline+=%=%-14.(%l,%c%V%)\ %p%%

" self explanatory, right?
set encoding=utf-8

" hide buffers instead of closing them
set hidden

" more brainz
set history=1000
" even more brainz
set undolevels=1000

" no more backup files
set nobackup
" let's hope we won't regret it one day
set noswapfile

if v:version >= 730
  " undo available even after reopening the file
  set undofile
  " we don't care about free space on our hdd, do we?
  set undodir=~/.vim/.undo,~/tmp,/tmp
endif

" seriously, stop beeping
set noerrorbells

" ignore line wrapping when navigating in normal mode
" (just in case if wrap will be enabled)
nmap j gj
nmap k gk

" assign syntax highlighting to *.target files
au BufRead,BufNewFile *.target set filetype=jproperties

map <F2> :NERDTreeToggle<CR>

" map F5 to insert date and time
:nnoremap <F7> "=strftime("%d.%m.%Y %H:%M:%S")<CR>P
:inoremap <F7> <C-R>=strftime("%d.%m.%Y %H:%M:%S")<CR>
" map F6 to insert date
:nnoremap <F6> "=strftime("%d.%m.%Y")<CR>P
:inoremap <F6> <C-R>=strftime("%d.%m.%Y")<CR>
" map F7 to insert time
:nnoremap <F5> "=strftime("%H:%M:%S")<CR>P
:inoremap <F5> <C-R>=strftime("%H:%M:%S")<CR>

autocmd BufEnter * Rvm
