" syntax
syntax enable

" basic
set nowrap
set modeline
set cursorline
set number
set foldmethod=marker
set ambiwidth=double

" file types
filetype on
filetype indent on
filetype plugin on
augroup filetypedetect
  au! BufRead,BufNewFile *.lib setfiletype php
  au! BufRead,BufNewFile *.yml setfiletype yaml
  au BufRead,BufNewFile *.php setfiletype php
  au BufNewFile,BufRead *.less set filetype=less
  autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
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

" show white space
set list
set listchars=tab:>\ ,extends:<

" highlight zenkaku space
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

" vim diff color
hi DiffAdd    ctermfg=cyan ctermbg=black
hi DiffChange ctermfg=white ctermbg=darkcyan
hi DiffDelete ctermfg=red ctermbg=darkgray
hi DiffText   ctermfg=white ctermbg=darkgray
