set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Sudo
"NeoBundle 'sudo.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'rbtnn/rabbit-ui.vim'
NeoBundle 'rbtnn/rabbit-ui-collection.vim'

" Ruby
"NeoBundle 'ruby-matchit'

" Comment
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'

" Rails
"NeoBundle 'ujihisa/unite-rake'
"NeoBundle 'basyura/unite-rails'

" CoffeeScript
"NeoBundle 'kchmck/vim-coffee-script'

" Titanium Mobile
"NeoBundle 'pekepeke/titanium-vim.git'

" PHP
"NeoBundle 'beyondwords/vim-twig.git'

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install bundles
" :NeoBundleUpdate(!)     - update bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
if neobundle#exists_not_installed_bundles()
	echomsg 'Not installed bundles : ' .
		\ string(neobundle#get_not_installed_bundle_names())
	echomsg 'Please execute ":NeoBundleInstall" command.'
	"finish
endif

" Show Invisible Characters
"set list
"set listchars=tab:^_,trail:_,extends:>,precedes:<
"highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
"highlight JpSpace cterm=underline ctermfg=7 guifg=7
"au BufRead,BufNew * match JpSpace /　/

" Basic
set nowrap
set modeline
set number
set foldmethod=marker
set ambiwidth=double
filetype on
filetype indent on
filetype plugin on
set nobackup

" Theme
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

" Encodings
set enc=utf-8
set fileencodings=utf-8,euc-jp,shift-jis,japan

" Tab
nmap <silent> <F4> :tabnew<CR>
nmap <silent> <F5> :tabp<CR>
nmap <silent> <F6> :tabn<CR>

" PasteMode Switch
set pastetoggle=<F11>

" Escaping HighlightMode with Esc x3
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Move cursor like FPS
noremap <S-a> h
noremap <S-s> j
noremap <S-d> l
noremap <S-w> k

" Binary edit (vim -b)
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre *.bin let &binary =1
	autocmd BufReadPost * if &binary | silent %!xxd -g 1
	autocmd BufReadPost * set ft=xxd | endif
	autocmd BufWritePre * if &binary | %!xxd -r | endif
	autocmd BufWritePost * if &binary | silent %!xxd -g 1
	autocmd BufWritePost * set nomod | endif
augroup END

" SwapFile Directory
set directory=$HOME/.vimswap

" Indent
set autoindent
set nosmartindent
set nocindent
set indentexpr=""
set ruler
set backspace=2

" Global Indent (Default)
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" {} Match Shows
set showmatch

" File Type
augroup filetypedetect
	au! BufRead,BufNewFile *.lib setfiletype php
	au! BufRead,BufNewFile *.yml setfiletype yaml
	au BufRead,BufNewFile *.php setfiletype php
	au BufNewFile,BufRead *.less set filetype=less
	autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
augroup end

" VIM Diff
hi DiffAdd    ctermfg=cyan ctermbg=black
hi DiffChange ctermfg=white ctermbg=darkcyan
hi DiffDelete ctermfg=red ctermbg=darkgray
hi DiffText   ctermfg=white ctermbg=darkgray

" Plugins Bind
" NERDTree
nmap <silent> <F7> :NERDTreeToggle<CR>

" Trailing Space
:nnoremap <silent> <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" tcomment
let g:tcommentMapLeader1 = '<C-_>'
let g:tcommentMapLeader2 = '<Leader>'
let g:tcommentMapLeaderOp1 = 'gc'
let g:tcommentMapLeaderOp2 = 'gC'

" lightline.vim
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ }

" Setting Local
if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif
