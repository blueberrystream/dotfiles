" encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,shift-jis,japan
scriptencoding utf-8

" syntax
syntax enable

" basic
set nowrap
set modeline
set number
set foldmethod=marker
set ambiwidth=double
set lazyredraw
set ttyfast
set scrolloff=5
set textwidth=0
set formatoptions=lmoq
set showcmd
set showmode
set ignorecase
set smartcase
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" file types
filetype on
filetype indent on
filetype plugin on
augroup filetypedetect
  autocmd BufRead,BufNewFile *.yml setfiletype yaml
  autocmd BufRead,BufNewFile *.php setfiletype php
  autocmd BufRead,BufNewFile *.less setfiletype less
  autocmd BufRead,BufNewFile *.erb setfiletype eruby.html
  autocmd BufRead,BufNewFile *.jb setfiletype ruby
  autocmd BufRead,BufNewFile Guardfile setfiletype ruby
  autocmd BufRead,BufNewFile *.scala setfiletype scala
  autocmd BufRead,BufNewFile .babelrc setfiletype json
  autocmd FileType gitcommit set textwidth=0
  autocmd BufWinEnter *.php set mps-=<:>
augroup end

" backup
set nobackup
set noswapfile

" color
set t_Co=256
highlight LineNr ctermfg=4
highlight CursorLineNr ctermfg=3

" indent
set noautoindent
set nosmartindent
set cindent
set indentexpr=""
set ruler
set backspace=start,eol,indent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" search
set incsearch
set hlsearch

" show matching bracket
set showmatch

" invisible characters
set list
set listchars=tab:>.,extends:>,precedes:<
set display=uhex
highlight ZenkakuSpace cterm=underline ctermfg=lightgreen guibg=darkgray
match ZenkakuSpace /　/

" cursor line
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup end

" vim diff color
hi DiffAdd ctermfg=cyan ctermbg=black
hi DiffChange ctermfg=white ctermbg=darkcyan
hi DiffDelete ctermfg=red ctermbg=darkgray
hi DiffText ctermfg=white ctermbg=darkgray

" nvim python
let g:python_host_prog = system('echo -n $(pyenv root)/versions/neovim2/bin/python')
let g:python3_host_prog = system('echo -n $(pyenv root)/versions/neovim3/bin/python')

" remember cursor
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
