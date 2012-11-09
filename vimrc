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
"set statusline+=%{rvm#statusline()}
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
" ctags, cscope binds
" make sure you have /home/.meta/ or replace it with some other directory to
" store tags/scope.out
nmap ,s :!find ~/src -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > ~/.meta/cscope.files<CR>
  \:!cscope -b -i ~/.meta/cscope.files -f ~/.meta/cscope.out<CR>
  \:cs reset<CR>
nmap ,t :!ctags -f ~/.meta/tags -L ~/.meta/cscope.files<CR>

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

set showmatch

" enable ctags
set tags=~/.meta/tags

" enable cscope
if has("cscope")
  cs add ~/.meta/cscope.out
  " basic cscope search for under-the-cursor
  map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
  " all cscope search types
  nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
  " same but with horizontal split (ctrl-space)
  "nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
  "nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  "nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
  " same but with vertical split (ctrl-space-space)
  "nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  "nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

colors solarized
set background=dark
