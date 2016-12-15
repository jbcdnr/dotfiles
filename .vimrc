syntax on " enable syntax processing
set background=light
colorscheme solarized

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2
set expandtab       " tabs are spaces
set autoindent      " autoindent the new line

set number              " show line numbers
set showcmd             " show command in bottom bar
set showmode            " show mode
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set wrapscan            " wrap search

" turn off search highlight
nnoremap <leader><space> :nohls<CR>

set vb              " visual bell

" folding stuff
set foldenable
set foldmethod=indent
set foldnestmax=20
set foldlevel=10

" Keep some stuff in the history
set history=100

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" new way to quit insert mode
:inoremap jk <Esc>

let mapleader=","       " leader is comma
nmap <silent> ,<space> :nohlsearch<CR>

" Automatically read a file that has changed on disk
set autoread

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>

" Make scrolling easier
nmap <silent> K 5k
nmap <silent> J 5j

" Wrap the left and right keys/arrows to change line
set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
