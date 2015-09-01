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

NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'sudo.vim'

NeoBundle 'tpope/vim-endwise'
NeoBundle 'bronson/vim-trailing-whitespace'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'rking/ag.vim'

" ruby
NeoBundle 'ruby-matchit'
NeoBundle 'thinca/vim-ref'
" rails
NeoBundle 'tpope/vim-rails'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
" slim
NeoBundle 'slim-template/vim-slim'

" json
NeoBundle 'elzr/vim-json'

" markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" Dockerfile
NeoBundle 'ekalinin/Dockerfile.vim'

" comment
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'

" go
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
NeoBundleLazy 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}
NeoBundleLazy 'dgryski/vim-godef', {"autoload": {"filetypes": ['go']}}
auto BufWritePre *.go Fmt

" code template
NeoBundle 'mattn/sonictemplate-vim'

" check syntax
NeoBundle 'scrooloose/syntastic'

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
nmap <silent> <F7> :NERDTreeToggle<CR>

" vim-markdown
let g:vim_markdown_folding_disabled=1

" lightline
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'solarized_dark',
\ }

" tcomment
let g:tcommentMapLeader1 = '<C-_>'
let g:tcommentMapLeader2 = '<Leader>'
let g:tcommentMapLeaderOp1 = 'gc'
let g:tcommentMapLeaderOp2 = 'gC'
