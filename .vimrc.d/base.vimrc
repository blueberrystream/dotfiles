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

" file types
filetype on
filetype indent on
filetype plugin on
augroup filetypedetect
  autocmd BufRead,BufNewFile *.yml setfiletype yaml
  autocmd BufRead,BufNewFile *.php setfiletype php
  autocmd BufRead,BufNewFile *.less setfiletype less
  autocmd BufRead,BufNewFile *.erb setfiletype eruby.html
  autocmd BufRead,BufNewFile Guardfile setfiletype ruby
augroup end

" backup
set nobackup
set noswapfile

" encoding
set enc=utf-8
set fileencodings=utf-8,euc-jp,shift-jis,japan

" color
set t_Co=256
set background=dark
colorscheme solarized
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
au BufWinEnter *.php set mps-=<:>

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
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" vim diff color
hi DiffAdd    ctermfg=cyan ctermbg=black
hi DiffChange ctermfg=white ctermbg=darkcyan
hi DiffDelete ctermfg=red ctermbg=darkgray
hi DiffText   ctermfg=white ctermbg=darkgray
