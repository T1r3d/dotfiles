" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set mouse=""        " Disable mouse usage (all modes)
set viminfo=""

"---
" Enable folding
"---
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

"---
" show ruler
"---
set ruler
set laststatus=2 "always show status line
set statusline=%F%m%r%h%w\ [dec=\%3.3b]\ [hex=\%02.2B]\ [pos=%04l:%04v][%p%%\ of\ %L]

"---
" enable wildmenue (:e ^D) for file selection...
"---
set wildmenu
set wildignore=.o,.exe,.dll,.so,.*~

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"---
" tell us when anything was changed by : <cmd>
"---
set report=0

"---
"remove error bell
"---
set noerrorbells
set t_vb=
set visualbell

"---
" set history size
"---
set history=250

"---
" show typed commnd in lower right corner (cmd's, selection length, etc)
"---
set showcmd

"---
" search stuff
"---
set incsearch
set hlsearch
"set noignorecase
set ignorecase
set magic "extended regexes

"-------
" tabbing
"-------
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set ts=4

"-------
" indent
"-------
set autoindent
set smartindent
set cindent

"---
" highlight cursor line and column
"---
hi CursorLine   cterm=NONE ctermbg=8 " ctermfg=white
hi CursorColumn cterm=NONE ctermbg=8 " ctermfg=white
set cursorline
set cursorcolumn

noremap  <F4> :set cursorline! cursorcolumn!<CR>
inoremap <F4> <ESC>:set cursorline! cursorcolumn!<CR>i


"---
" toggle paste
"---
set pastetoggle=<F3>

"---
" linenumbering on / off
"---
set number
noremap  <F2> :set nonumber!<CR>
inoremap <F2> <ESC>:set nonumber!<CR>i


"---
" mappings
"---
nmap ,, <C-]> "jump to tag
nmap <CR> i<CR><ESC>
"nmap <TAB> ==
" auto indent
nmap -- gg=G''
" unhilight search
imap <silent> <C-C> <ESC>:nohlsearch<CR>a
nmap <silent> <C-C> :nohlsearch<CR>

"---
" fix backspace on some systems
"---
set backspace=indent,eol,start

"---
" after using autocomplete close the preview window
" since vim 7.4.
"---
autocmd CompleteDone * pclose

"---
" default encoding
"---
set encoding=utf-8

"---
" completion stuff (^p)
"
" show fancy menu for completition
"---
set completeopt=longest,menuone,preview "preview shows a nice preview window of the function...
"set completeopt=longest,menuone,preview
"set completeopt=longest,menuone

"
"----------------------------------( python )
"
" enable all Python syntax highlighting features
let python_highlight_all = 1


"
"----------------------------------( yaml )
"
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab




" custom splash screen
fun! Start()

  "Create a new unnamed buffer to display our splash screen inside of.
  enew
  
  " Set some options for this buffer to make sure that does not act like a
  " normal winodw.
  setlocal
    \ bufhidden=wipe
    \ buftype=nofile
    \ nobuflisted
    \ nocursorcolumn
    \ nocursorline
    \ nolist
    \ nonumber
    \ noswapfile
    \ norelativenumber

  " Our message goes here.
  "call append('$', "\t Welcome to OTW\n\n\there are some shortcuts to make your lyfe more eezy:\a\a\t")

  " read splash from file
  exec ":r /etc/vim/splash"

  " When we are done writing out message set the buffer to readonly.
  setlocal
    \ nomodifiable
    \ nomodified

  " Just like with the default start page, when we switch to insert mode
  " a new buffer should be opened which we can then later save.
  nnoremap <buffer><silent> e :enew<CR>
  nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
  nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
  

endfun
if argc() == 0
  autocmd VimEnter * call Start()
endif