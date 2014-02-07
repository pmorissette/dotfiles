set nocompatible
filetype off 		" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto='git'

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'klen/python-mode'
Bundle 'msanders/snipmate.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'digitaltoad/vim-jade'
Bundle 'mattn/emmet-vim'
Bundle 'vim-scripts/pydoc.vim'

let mapleader=" "
inoremap jj <ESC>

" sudo write this
cmap W! !sudo tee % > /dev/null

" open/close the quickfix window
"nmap <leader>c :copen<cr>
nmap <leader>x :cclose<cr>

" close buffer but not split
nmap <leader>C :b#<bar>bd#<CR><CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" leader mappings
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :e 
" vertical and horizontal split
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
" control-p
nnoremap <leader>p :CtrlP<CR>
" window switching
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader>h <c-w>h
" window switching - also w/ ctrl key
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
imap <C-W> <C-O><C-W>
" hide matches on <leader>space
nnoremap <leader>u :nohlsearch<CR>
" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
"Git fugitive
map <leader>gw :Gwrite<CR>
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Git push origin master<CR>
" py.test
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" set powerline fonts for airline
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'unicode'
set t_Co=256

" ctrlp
set wildignore+=*.pyc,*.swp,*/env/*,*/node_modules/*,*/.git/*
" let g:ctrlp_cmd = 'CtrlPMixed'


" Reload all buffers from file - good for when we don't use 
" fugitive and want to refresh files without annoying confirmation
function! ReloadBuffers()
    set noconfirm
    bufdo e!
    set confirm
    echo "Reload buffers?"
endfunction

nmap <leader>rb :call ReloadBuffers()<CR>

" pydoc
let g:pydoc_cmd = "python -m pydoc"

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set wrap                    " Wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set textwidth=80            " Lines are automatically wrapped after 80 columns

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.

""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

colorscheme solarized
set background=dark

" modify emmet shortcut key
let g:user_emmet_leader_key = '<c-e>'

" You complete me
" Close window w/ doc (preview window) when done insertion
"let g:ycm_autoclose_preview_window_after_completion = 1


" PYTHON STUFF
"
" Run python (nose) tests
map <F5> <Esc>:!clear;nosetests -d<CR>

" Auto-pep
map <F9> <Esc>:PymodeLintAuto<CR>

" Documentation
" handled by pydoc plugin
let g:pymode_doc = 0

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_on_write = 1

" virtualenvs

" Load run code plugin
let g:pymode_run = 1
" Key for run python code
let g:pymode_run_key = '<leader>r'

" Auto jump to next lint error
let g:pymode_lint_jump = 1

" virtualenv
let g:pymode_virtualenv = 1

" enable breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
" let g:pymode_folding = 0

" turn off rop
let g:pymode_rope = 0

" Skip errors and warnings
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
" let g:pymode_lint_ignore = "E501"
" ignoring mccabe errors
let g:pymode_lint_ignore = "C"
