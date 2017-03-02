" set default shell to bash as some plugins don't work in other shells
set shell=/bin/bash

" say bye bye to vi
set nocompatible

" change terminal's title
set title

" force reloading *after* pathogen loaded
filetype off

" pathogen magic
call pathogen#infect()
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

set wildignore+=*.o,*.swp

" seriously, stop beeping
set noerrorbells

" ignore line wrapping when navigating in normal mode
" (just in case if wrap will be enabled)
nmap j gj
nmap k gk

"-------- ctags / cscope --------

" superseded by rtags, keeping around for nostalgic reasons
if 0
" ctags, cscope binds
" make sure you have /home/.meta/ or replace it with some other directory to
" store 'tags' and 'scope.out'
nmap ,s :!~/.meta/build_index.rb --config ~/.meta/config.yaml > ~/.meta/cscope.files<CR>
  \:!cscope -b -i ~/.meta/cscope.files -f ~/.meta/cscope.out<CR>
  \:cs reset<CR>
nmap ,t :!ctags -f ~/.meta/tags -L ~/.meta/cscope.files<CR>
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
endif
endif

" -------------------------------

" assign syntax highlighting to *.target files
au BufRead,BufNewFile *.target set filetype=jproperties
au BufRead,BufNewFile *.log set filetype=skyliblog

noremap <F2> :NERDTreeToggle<CR>

" map F5 to insert date and time
:nnoremap <F7> "=strftime("%d.%m.%Y %H:%M:%S")<CR>P
:inoremap <F7> <C-R>=strftime("%d.%m.%Y %H:%M:%S")<CR>
" map F6 to insert date
:nnoremap <F6> "=strftime("%d.%m.%Y")<CR>P
:inoremap <F6> <C-R>=strftime("%d.%m.%Y")<CR>
" map F7 to insert time
:nnoremap <F5> "=strftime("%H:%M:%S")<CR>P
:inoremap <F5> <C-R>=strftime("%H:%M:%S")<CR>

noremap <C-K> :pyf /usr/local/Cellar/clang-format/2016-08-03/share/clang/clang-format.py<CR>
inoremap <C-K> <c-o>:pyf /usr/local/Cellar/clang-format/2016-08-03/share/clang/clang-format.py<CR>

set showmatch

"colors solarized
colors gruvbox
set background=dark
set backspace=indent,eol,start
set cinoptions=l1,g0

" ctrl-p like fuzzy search (should be faster)
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF<CR>

" ------- rtags bindings --------
"let g:rtagsUseDefaultMappings = 0
let g:rtagsUseLocationList = 0
noremap ,j :call rtags#JumpTo(g:SAME_WINDOW)<CR>
noremap ,J :call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
noremap ,<C-x>j :call rtags#JumpTo(g:H_SPLIT)<CR>
noremap ,<C-v>j :call rtags#JumpTo(g:V_SPLIT)<CR>
"noremap <C-t>j :call rtags#JumpTo(g:NEW_TAB)<CR>
noremap ,i :call rtags#SymbolInfo()<CR>
noremap ,p :call rtags#JumpToParent()<CR>
noremap ,f :call rtags#FindRefs()<CR>
noremap ,n :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap ,s :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap ,r :call rtags#RenameSymbolUnderCursor()<CR>
noremap ,v :call rtags#FindVirtuals()<CR>
noremap ,b :call rtags#JumpBack()<CR>
noremap ,C :call rtags#FindSuperClasses()<CR>
noremap ,c :call rtags#FindSubClasses()<CR>
" -------------------------------
