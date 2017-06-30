filetype off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'
NeoBundle 'kana/vim-fakeclip'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'sudo.vim'

NeoBundle 'tpope/vim-surround'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'miyakogi/seiya.vim'

NeoBundle 'rking/ag.vim'

NeoBundle 'editorconfig/editorconfig-vim'

" ruby
NeoBundle 'ruby-matchit'
NeoBundle 'tpope/vim-endwise'
" rails
NeoBundle 'tpope/vim-rails'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
" slim
NeoBundle 'slim-template/vim-slim'
" CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'

" php
NeoBundle 'beyondwords/vim-twig'
NeoBundle 'jwalton512/vim-blade'

" json
NeoBundle 'elzr/vim-json'

" Dockerfile
NeoBundle 'ekalinin/Dockerfile.vim'

" scala
NeoBundle 'derekwyatt/vim-scala'

" comment
NeoBundle 'tomtom/tcomment_vim'

" go
"set rtp+=$GOROOT/misc/vim
"exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
"set completeopt=menu,preview
"exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
"NeoBundleLazy 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}
"NeoBundleLazy 'dgryski/vim-godef', {"autoload": {"filetypes": ['go']}}
"auto BufWritePre *.go Fmt

" handlebars
NeoBundle 'mustache/vim-mustache-handlebars'

" vue
NeoBundle 'posva/vim-vue'

" check syntax
NeoBundle 'scrooloose/syntastic'

" formatter
NeoBundle 'mitermayer/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

" installation check
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
    \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

call neobundle#end()

NeoBundleCheck

filetype plugin indent on

" NERDTree
let NERDTreeShowHidden = 1
nnoremap <silent> <F7> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim-markdown
let g:vim_markdown_folding_disabled=1

" lightline
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'solarized',
\ }

" tcomment
let g:tcommentMapLeader1 = '<C-_>'
let g:tcommentMapLeader2 = '<Leader>'
let g:tcommentMapLeaderOp1 = 'gc'
let g:tcommentMapLeaderOp2 = 'gC'

" Seiya
let g:seiya_auto_enable = 1

" vim-prettier
let g:prettier#config#print_width = 200
